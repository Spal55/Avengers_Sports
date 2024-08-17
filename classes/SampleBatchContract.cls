/**
 *
 */
global class SampleBatchContract extends vlocity_cmt.DocTemplateMappingAbstractClass {
   
    /**
     *
     */
    private static final Integer DEFAULT_PAGE_SIZE = 50;
   
    /**
     *
     */
    private static final String TABLE_START =
        '<table border="1" repeatHeader="true">' +
            '<tr style="color: #3366ff;">' +
                '<th><strong><viawrapper>Id</viawrapper></strong></th>' +
                '<th><strong><viawrapper>Name</viawrapper></strong></th>'+
                '<th><strong><viawrapper>Quantity</viawrapper></strong></th>' +
                '<th><strong><viawrapper>Price</viawrapper></strong></th>' +
            '</tr>';
   
    /**
     *
     */
    private static final String TABLE_BODY =
            '<tr>' +
                '<td><viawrapper>{Id}</viawrapper></td>' +
                '<td><viawrapper>{Name}</viawrapper></td>' +
                '<td><viawrapper>{Quantity}</viawrapper></td>' +
                '<td><viawrapper>{Price}</viawrapper></td>' +
            '</tr>';
   
    /**
     *
     */
     private static final String TABLE_END =
        '</table>';
   
    /**
     * Specify the namespace prefix of deployed package
     */
    private static final String NAMESPACE_PREFIX = 'vlocity_cmt__';
   
    /**
     *
     */
    private static final String COUNT_CONTRACT_LINES;

    /**
     *
     */
    private static final String QUERY_INITIAL_CONTRACT_LINES;
   
    /**
     *
     */
    private static final String QUERY_SUCCEEDING_CONTRACT_LINES;    
   
     /**
     *
     */
    private static final String QUERY_SECTION_SEQUENCE;  
   
    /**
     *
     */
    static
    {
        String queryContractLines =
            'SELECT count() ' +
            'FROM $nmspc$ContractLineItem__c ' +
            'WHERE IsDeleted!=true AND $nmspc$ContractId__c=:objectId';
        COUNT_CONTRACT_LINES = queryContractLines.replace('$nmspc$', NAMESPACE_PREFIX);
       
        String queryInitialContractLines =
            'SELECT Id, Name, $nmspc$Quantity__c, $nmspc$OneTimeTotal__c ' +
            'FROM $nmspc$ContractLineItem__c ' +
            'WHERE ($nmspc$ContractId__c =: contractId) ' +
            'ORDER BY Id ' +
            'LIMIT :pageOffset';
        QUERY_INITIAL_CONTRACT_LINES = queryInitialContractLines.replace('$nmspc$', NAMESPACE_PREFIX);
       
        String querySucceedingContractLines =
            'SELECT Id, Name, $nmspc$Quantity__c, $nmspc$OneTimeTotal__c ' +
            'FROM $nmspc$ContractLineItem__c ' +
            'WHERE ($nmspc$ContractId__c =: contractId AND Id >: lastItemId) ' +
            'ORDER BY Id ' +
            'LIMIT :pageOffset';
        QUERY_SUCCEEDING_CONTRACT_LINES = querySucceedingContractLines.replace('$nmspc$', NAMESPACE_PREFIX);
       
        String querySectionSequence =
            'SELECT $nmspc$Sequence__c, $nmspc$Level__c, Id, Name ' +
            'FROM $nmspc$DocumentTemplateSection__c ' +
            'WHERE $nmspc$DocumentTemplateId__c=:templateId AND Name=:sectionName ' +
            'ORDER BY $nmspc$Sequence__c, $nmspc$Level__c';
        QUERY_SECTION_SEQUENCE = querySectionSequence.replace('$nmspc$', NAMESPACE_PREFIX);
    }

    /**
     *
     */    
    private boolean isPaginationOptionsInitialized = false;
   
    /**
     *
     */
    private Id lastItemProcessed;
   
    /**
     *
     */
    global SampleBatchContract()
    {
        this.pageSize = DEFAULT_PAGE_SIZE;
    }
   
    /**
     *
     */
    global override List<Object> getNextSet(String sectionName)
    {
       
        lastItemProcessed = (Id) paginationOptionsMap.get('lastItemProcessed');
        Integer recordNumber = (Integer) paginationOptionsMap.get('recordNumber');
        Integer totalRecords = (Integer) paginationOptionsMap.get('totalRecords');
       
        List<vlocity_cmt__ContractLineItem__c> lineItems = getContractLineItems(objectId, lastItemProcessed, this.pageSize);
       
        List<Object> nextSet = new List<Object>();
       
        if (lastItemProcessed == null)
        {
            nextSet.add(TABLE_START);
        }
       
        for (vlocity_cmt__ContractLineItem__c lineItem : lineItems)
        {
            String html = TABLE_BODY;
            html = html.replace('{Id}', (String) lineItem.get('Id'));
            html = html.replace('{Name}', (String) lineItem.get('Name'));
            html = html.replace('{Quantity}', String.valueOf(lineItem.get(NAMESPACE_PREFIX + 'Quantity__c')));
            html = html.replace('{Price}', String.valueOf(lineItem.get(NAMESPACE_PREFIX + 'OneTimeTotal__c')));
           
            nextSet.add(html);
        }
       
        lastItemProcessed = (Id) lineItems[lineItems.size()-1].get('Id');
       
       
       
        updatePaginationOptions(sectionName);
       
        recordNumber = (Integer) paginationOptionsMap.get('recordNumber');
        totalRecords = (Integer) paginationOptionsMap.get('totalRecords');
       
        if (recordNumber >= totalRecords)
        {
            nextSet.add(TABLE_END);
        }
       
        /*
        Integer idx = 0;
        for (Object line : nextSet)
        {
            System.debug('getNextSet:line[' + (idx++) + '] -> ' + String.valueOf(line));
        }
        */
        System.debug('getNextSet:pageOffset -> ' + this.pageSize);
        System.debug('getNextSet:nextSet -> ' + nextSet);
        return nextSet;
    }
   
    /**
     *
     */
    private void initializePaginationOptions(String sectionName)
    {
        paginationOptionsMap.put('isInitialized', true);
        paginationOptionsMap.put('lastSectionName', sectionName);
        paginationOptionsMap.put('recordNumber', 0);
        paginationOptionsMap.put('pageOffset', this.pageSize);
        paginationOptionsMap.put('totalRecords', getBatchDataCount(sectionName));
       
        System.debug('initializePaginationOptions() paginationOptionsMap -> ' + paginationOptionsMap);        
    }
   
    /**
     *
     */
    private void updatePaginationOptions(String sectionName)
    {
        Integer recordNumber = (Integer) paginationOptionsMap.get('recordNumber');
        Integer pageOffset = (Integer) paginationOptionsMap.get('pageOffset');
       
        paginationOptionsMap.put('recordNumber', recordNumber + pageOffset);
        paginationOptionsMap.put('lastItemProcessed', lastItemProcessed);
       
        System.debug('updatePaginationOptions() paginationOptionsMap -> ' + paginationOptionsMap);  
    }
   
    /**
     *
     */
    private List<vlocity_cmt__ContractLineItem__c> getContractLineItems(Id contractId, Id lastItemId, Integer pageOffset)
    {
        List<vlocity_cmt__ContractLineItem__c> lineItems = null;
        if (lastItemId == null)
        {
            lineItems = Database.query(QUERY_INITIAL_CONTRACT_LINES);
        }
        else
        {
            lineItems = Database.query(QUERY_SUCCEEDING_CONTRACT_LINES);
        }

        System.debug('getContractLineItems() lineItems -> ' + lineItems);          
        return lineItems;
    }
   
    /**
     *
     */
    global override Boolean hasNextSet(String sectionName)
    {
        if (!paginationOptionsMap.containsKey('isInitialized'))
        {
            initializePaginationOptions(sectionName);
        }
       
        Integer recordNumber = (Integer) paginationOptionsMap.get('recordNumber');
        Integer totalRecords = (Integer) paginationOptionsMap.get('totalRecords');
       
        Boolean hasNextSet = recordNumber < totalRecords;
       
        System.debug('hasNextSet:hasNextSet -> ' + hasNextSet);
        return hasNextSet;
    }
   
    /**
     *
     */
    global override Integer getStartIndex()
    {
        Double sequence = 0.0;
        String sectionName = (String) paginationOptionsMap.get('lastSectionName');
       
        List<vlocity_cmt__DocumentTemplateSection__c> sections = Database.query(QUERY_SECTION_SEQUENCE);
       
        for (vlocity_cmt__DocumentTemplateSection__c section : sections)
        {
            System.debug('Name-----------' + section.get('Name'));
            System.debug('Id-------------' + section.get('Id'));
            System.debug('Sequence__c----' + section.get(NAMESPACE_PREFIX + 'Sequence__c'));
            sequence =  (Double) section.get(NAMESPACE_PREFIX + 'Sequence__c');
        }
       
        Double startIndex = paginationOptionsMap.ContainsKey('sequence') ?
            (Double) paginationOptionsMap.get('sequence') : 0;
       
        startIndex = startIndex > 0 ? startIndex - sequence + 1: startIndex;
       
        System.debug('getStartIndex:startIndex -> ' + startIndex);
        return startIndex.intValue() ;
    }
   
    /**
     *
     */
    global override Integer getBatchDataCount(String sectionName)
    {
        Integer contractLines = Database.countQuery(COUNT_CONTRACT_LINES);
       
        Integer remainder = Math.mod(contractLines, this.pageSize);
        Integer batchDataCount = (contractLines/this.pageSize + (remainder>0 ? 1 : 0)) * this.pageSize;
       
        System.debug('getBatchDataCount:sectionName -> ' + sectionName);
        System.debug('getBatchDataCount:batchDataCount -> ' + batchDataCount);
        return batchDataCount;
    }
   
}