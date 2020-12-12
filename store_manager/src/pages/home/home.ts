import { Component } from '@angular/core';
import { NavController, LoadingController, NavParams, AlertController } from 'ionic-angular';
import { AuthProvider } from '../../providers/auth/auth';
import { ViewdetailPage } from '../viewdetail/viewdetail';
import { TabsPage } from '../tabs/tabs';
import { StatusPage } from '../status/status';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  userData = {"id":"", "token":"", "orderid" : ""};
  response:any;

  orders:any;

  constructor(public auth:AuthProvider, public alertCtrl: AlertController, public navCtrl: NavController, public navParams: NavParams, public loadingCtrl: LoadingController) {
    if(localStorage.getItem('UserData')){
      const data = JSON.parse(localStorage.getItem('UserData'));
      this.userData.id = data.id;
    }
    this.getorders();
  }

  ionViewWillEnter(){
    this.getorders();
  }


  getorders(){


    let zest = this.loadingCtrl.create({
      content: "Loading...",
      duration:20000,
      spinner:'crescent'
    });  

    zest.present();

      this.auth.postData(this.userData, "/getmyordersstore").then(
        result => {
          zest.dismiss();
          this.response = result;
          if(this.response.OrderData){
            this.orders = this.response.OrderData;
          }
        },
        err => {
          zest.dismiss();
        }
      );
    }


    viewOrder(oid){
      this.navCtrl.push(ViewdetailPage,{
        orderid : oid
      });
    }


    deliver(oid){
      this.navCtrl.push(StatusPage,{
        orderid: oid
      });
    }
}
