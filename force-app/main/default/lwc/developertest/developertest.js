import getAccountList from '@salesforce/apex/DeveloperTestApexController.getAccountList';
import { NavigationMixin } from 'lightning/navigation';
import { api, LightningElement, track } from 'lwc';

const HEADER = 'Accounts'
export default class Developertest extends NavigationMixin(LightningElement) {
    @api flexipageRegionWidth;
    @track cardTitle;
    @track accounts;

    @api
    set header(header) {
        this.cardTitle = header;
    }

    get header() {
        return this.cardTitle || HEADER;
    }

    get buttonClass() {
        return !this.cardTitle ? this.flexipageRegionWidth: 'COMMUNITY';
    }

    async handleClick() {
        this.accounts = await getAccountList();
    }

    navigateToRecord(event) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.target.name,
                actionName: 'view'
            }
        });
    }
}