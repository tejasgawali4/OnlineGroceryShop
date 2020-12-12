import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, AlertController, LoadingController } from 'ionic-angular';
import { AuthProvider } from '../../providers/auth/auth';
import { TabsPage } from '../tabs/tabs';

@IonicPage()
@Component({
  selector: 'page-status',
  templateUrl: 'status.html',
})
export class StatusPage {

  userData = {"id":"", "token":"", "orderid" : ""};
  response:any;

  orders:any;
  ddata:any;

  postdata = {
    deliveryboy : "",
    status : "",
    orderid : ""
  };

  constructor(public auth:AuthProvider, public alertCtrl: AlertController, public navCtrl: NavController, public navParams: NavParams, public loadingCtrl: LoadingController) {
    if(localStorage.getItem('UserData')){
      const data = JSON.parse(localStorage.getItem('UserData'));
      this.userData.id = data.id;
    }
    
    this.userData.orderid = this.navParams.get("orderid");
    console.log(this.userData);
    this.getdetails();
  }


  getdetails(){

    let zest = this.loadingCtrl.create({
      content: "Loading...",
      duration:20000,
      spinner:'crescent'
    });  

    zest.present();

      this.auth.postData(this.userData, "/getdetailsorders").then(
        result => {
          zest.dismiss();
          this.response = result;
          if(this.response.OrderData){
            this.orders = this.response.OrderData;
            this.ddata = this.response.ddata;

            this.postdata.status = this.orders.status;
            this.postdata.deliveryboy = this.orders.driverid;
          }
        },
        err => {
          zest.dismiss();
        }
      );
    }


    doupdate(){

      this.postdata.orderid = this.userData.orderid;

      console.log(this.postdata);

      let zest = this.loadingCtrl.create({
        content: "Loading...",
        duration:20000,
        spinner:'crescent'
      });  
  
      zest.present();
  
        this.auth.postData(this.postdata, "/updateorderstatusstore").then(
          result => {
            zest.dismiss();
            this.response = result;
            if(this.response.status == 'success'){
              let alert = this.alertCtrl.create({
                title: "Success",
                subTitle: "Order Status Updated!",
                buttons: ["Close"]
              });
              alert.present();
              this.navCtrl.setRoot(TabsPage);
            }
          },
          err => {
            zest.dismiss();
          }
        );
      }

}
