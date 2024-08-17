import { LightningElement } from 'lwc';
 
export default class SocialMediaContact extends LightningElement {
    socialMediaLinks = [
        { name: 'Instagram', url: 'https://www.instagram.com/suparno_official', icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png' },
        { name: 'Whatsapp', url: 'https://wa.me/918637567454', icon: 'https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg' },
    ];
    contactInfo = {
        name: 'Avenger Sports',
        email: 'contact@avengers.sports',
        phone: '8637567454'
    };
}