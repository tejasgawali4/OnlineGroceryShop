import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, AlertController, LoadingController } from 'ionic-angular';
import { AuthProvider } from '../../providers/auth/auth';


@IonicPage()
@Component({
  selector: 'page-viewdetail',
  templateUrl: 'viewdetail.html',
})
export class ViewdetailPage {

  userData = {"id":"", "token":"", "orderid" : ""};
  response:any;

  orders:any;
  orderdetails:any;

  constructor(public auth:AuthProvider, public alertCtrl: AlertController, public navCtrl: NavController, public navParams: NavParams, public loadingCtrl: LoadingController) {
    if(localStorage.getItem('UserData')){
      const data = JSON.parse(localStorage.getItem('UserData'));
      this.userData.id = data.id;
    }
    
    this.userData.orderid = this.navParams.get("orderid");
    this.getdetails();
  }


  getdetails(){


    let zest = this.loadingCtrl.create({
      content: "Loading...",
      duration:20000,
      spinner:'crescent'
    });  

    zest.present();

      this.auth.postData(this.userData, "/getdetails").then(
        result => {
          zest.dismiss();
          this.response = result;
          if(this.response.OrderData){
            this.orders = this.response.OrderData;
            this.orderdetails = this.response.OrderDetail;
          }
        },
        err => {
          zest.dismiss();
        }
      );
    }

}
