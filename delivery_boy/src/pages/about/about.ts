import { Component } from '@angular/core';
import { NavController, AlertController, LoadingController, NavParams } from 'ionic-angular';
import { AuthProvider } from '../../providers/auth/auth';
import { ViewdetailPage } from '../viewdetail/viewdetail';

@Component({
  selector: 'page-about',
  templateUrl: 'about.html'
})
export class AboutPage {
  userData = {"id":"", "token":""};
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



  viewOrder(oid){
    this.navCtrl.push(ViewdetailPage,{
      orderid : oid
    });
  }


  getorders(){


    let zest = this.loadingCtrl.create({
      content: "Loading...",
      duration:20000,
      spinner:'crescent'
    });  

    zest.present();

      this.auth.postData(this.userData, "/getmyorders").then(
        result => {
          zest.dismiss();
          this.response = result;
          if(this.response.OrderData){
            this.orders = this.response.OrderData;
            console.log(this.orders);
          }
        },
        err => {
          zest.dismiss();
        }
      );
    }


}
