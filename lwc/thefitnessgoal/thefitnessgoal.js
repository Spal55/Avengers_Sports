import { LightningElement } from 'lwc';
export default class Thefitnessgoal extends LightningElement {

    hgt=0;
    wgt=0;
    bmi=0;
    bmiReport="";
    isfitness=false;
    isbmi=false;
    isavail=false;

    handleHeight(event) {
        this.hgt=parseInt(event.target.value);
    }
    handleWeight(event) {
        this.wgt=parseInt(event.target.value);
    }

    callfitness(){
        this.template.querySelector('c-improve-fitness');
        this.isfitness=true;
    }

    closefitness(){
        this.isfitness=false;
    }

    closebmi(){
        this.isbmi=false;
        this.handleClear();
    }


    calBMI(){

        this.isbmi=true;
        this.bmi=parseInt(this.wgt/(this.hgt*this.hgt/10000));
        if(this.bmi>0 && this.bmi<20)
        {
            this.bmiReport='Underweight';
            this.isavail=true;
        }
        else if(this.bmi>19 && this.bmi<27)
        {
            this.bmiReport='Normal';
            this.isavail=true;
        }
        else if(this.bmi>26 && this.bmi<41)
        {
            this.bmiReport='Overweight';
            this.isavail=true;
        }
        else if(this.bmi>40)
        {
            this.bmiReport='Obese';
            this.isavail=true;
        }
        else
        {
            this.bmiReport='Trying to fool with us';
            this.isavail=false;
        }

    }
    
    handleClear(){
        this.hgt="";
        this.wgt="";
        this.bmi="";
        this.bmiReport="";
        this.isavail=false;
        this.isbmi=false;
    }

}