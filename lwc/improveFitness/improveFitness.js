import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class ImproveFitness extends NavigationMixin(LightningElement) {

    @api isShowModal1 = false;
    @api isShowModal2 = false;
    @api name;
    @api iweight=0;
    @api fweight=0;
    @api age=0;
    @api diffweight=0;
    @api calorie1=0;
    @api calorie2=0;
    @api calorie3=0;
    @api calorie4=0;
    @api calorie5=0;
    @api height=0;
    @api isloss=false;
    @api isfast=false;


    @api handleNameChange(event) {
        this.name=event.target.value;
    }

    @api handleAgeChange(event) {
        this.age=parseFloat(event.target.value);
    }

    @api handleTargetChange(event) {
        this.fweight=parseFloat(event.target.value);
    }

    @api value = 'Male';

    @api get options() {
        return [
            { label: 'Male', value: 'male' },
            { label: 'Female', value: 'female' },
        ];
    }

    @api navigateToWebPage() {
        this[NavigationMixin.Navigate]({
            "type": "standard__webPage",
            "attributes": {
                "url": "https://wa.me/918637567454?text=Hi,20%I20%want20%to20%know20%more20%about20%my20%fitness20%!"
            }
        });
    }

    @api handleGenderChange(event) {
        this.value = event.detail.value;
    }

    @api showModalBox1() {  

        this.isShowModal1 = true;
        this.isShowModal2 = false;
        
        if(this.value=='male')
        {
            if(this.age>18 && this.age<41)
            {
                this.diffweight=this.fweight-this.iweight;
                if(this.diffweight>0)
                {
                    this.calorie1= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))-300);
                    this.calorie2= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))-200);
                    this.calorie3= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))-100);
                    this.calorie4= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))-0);
                    this.calorie5= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))+100);

                }
                else if(this.diffweight<0)
                {
                    this.isloss=true;
                    this.calorie1= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.iweight)+(5.03*this.height))))-150);
                    this.calorie2= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.iweight)+(5.03*this.height))))-200);
                    this.calorie3= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.iweight)+(5.03*this.height))))-250);
                    this.calorie4= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.iweight)+(5.03*this.height))))-300);
                    this.calorie5= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.iweight)+(5.03*this.height))))-400);
                }
                else
                {
                    this.calorie1= parseInt((864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))-0);
                    this.calorie2= parseInt(864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))-50;
                    this.calorie3= parseInt(864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))-100;
                    this.calorie4= parseInt(864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))-150;
                    this.calorie5= parseInt(864-(9.72*this.age)+(1.27*((14.2*this.fweight)+(5.03*this.height))))-200;
                }
            }
        }
        if(this.value=='female')
        {
            if(this.age>18 && this.age<41)
            {
                this.diffweight=this.fweight-this.iweight;
                if(this.diffweight>0)
                {
                    this.calorie1= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-300;
                    this.calorie2= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-200;
                    this.calorie3= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-100;
                    this.calorie4= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-0;
                    this.calorie5= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))+100;
                }
                else if(this.diffweight<0)
                {
                    this.isloss=true;
                    this.calorie1= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-100;
                    this.calorie2= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-150;
                    this.calorie3= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-200;
                    this.calorie4= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-250;
                    this.calorie5= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-300;
                }
                else
                {
                    this.calorie1= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-0;
                    this.calorie2= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-50;
                    this.calorie3= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-100;
                    this.calorie4= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-150;
                    this.calorie5= parseInt(387-(7.31*this.age)+(1.27*((10.9*this.fweight)+(6.61*this.height))))-200;
                }
            }
        }
    }

    @api showModalBox2() {  
        this.isShowModal2 = true;
        this.isShowModal1 = false;
        if(this.value=='male')
        {
            if(this.age>18 && this.age<41)
            {
                this.diffweight=this.fweight-this.iweight;
                if(this.diffweight>0)
                {
                    this.calorie1= parseInt((864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))-300);
                    this.calorie2= parseInt((864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))-200);
                    this.calorie3= parseInt((864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))-100);
                    this.calorie4= parseInt((864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))-0);
                    this.calorie5= parseInt((864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))+100);

                }
                else if(this.diffweight<0)
                {
                    this.isloss=true;
                    this.isfast=true;
                    this.calorie1= parseInt((864-(9.72*this.age)+(1*((14.2*this.iweight)+(5.03*this.height))))-150);
                    this.calorie2= parseInt((864-(9.72*this.age)+(1*((14.2*this.iweight)+(5.03*this.height))))-200);
                    this.calorie3= parseInt((864-(9.72*this.age)+(1*((14.2*this.iweight)+(5.03*this.height))))-250);
                    this.calorie4= parseInt((864-(9.72*this.age)+(1*((14.2*this.iweight)+(5.03*this.height))))-300);
                    this.calorie5= parseInt((864-(9.72*this.age)+(1*((14.2*this.iweight)+(5.03*this.height))))-400);
                }
                else
                {
                    this.calorie1= parseInt((864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))-0);
                    this.calorie2= parseInt(864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))-50;
                    this.calorie3= parseInt(864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))-100;
                    this.calorie4= parseInt(864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))-150;
                    this.calorie5= parseInt(864-(9.72*this.age)+(1*((14.2*this.fweight)+(5.03*this.height))))-200;
                }
            }
        }
        if(this.value=='female')
        {
            if(this.age>18 && this.age<41)
            {
                this.diffweight=this.fweight-this.iweight;
                if(this.diffweight>0)
                {
                    this.calorie1= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-300;
                    this.calorie2= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-200;
                    this.calorie3= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-100;
                    this.calorie4= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-0;
                    this.calorie5= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))+100;
                }
                else if(this.diffweight<0)
                {
                    this.isloss=true;
                    this.isfast=true;
                    this.calorie1= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-100;
                    this.calorie2= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-150;
                    this.calorie3= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-200;
                    this.calorie4= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-250;
                    this.calorie5= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-300;
                }
                else
                {
                    this.calorie1= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-0;
                    this.calorie2= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-50;
                    this.calorie3= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-100;
                    this.calorie4= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-150;
                    this.calorie5= parseInt(387-(7.31*this.age)+(1*((10.9*this.fweight)+(6.61*this.height))))-200;
                }
            }
        }

    }

    @api hideModalBox() {  
        this.isShowModal1 = false;
        this.isShowModal2 = false;
    }

    @api close() {
        this.dispatchEvent(
            new CustomEvent("close", {
                detail: {}   
            }));
    }

}