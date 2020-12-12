import { Component } from '@angular/core';
import { NavController, LoadingController, NavParams, AlertController } from 'ionic-angular';
import { AuthProvider } from '../../providers/auth/auth';
import { ViewdetailPage } from '../viewdetail/viewdetail';
import { TabsPage } from '../tabs/tabs';

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


    viewOrder(oid){
      this.navCtrl.push(ViewdetailPage,{
        orderid : oid
      });
    }


    deliver(oid, dcode){
      this.userData.orderid = oid;
      let alert = this.alertCtrl.create({
        title: 'Delivery Code',
        inputs: [
          {
            name: 'dcode',
            placeholder: 'Code'
          }
        ],
        buttons: [
          {
            text: 'Cancel',
            role: 'cancel',
            handler: data => {
              console.log('Cancel clicked');
            }
          },
          {
            text: 'Confirm',
            handler: data => {
              if(data.dcode == dcode){

                let zest = this.loadingCtrl.create({
                  content: "Loading...",
                  duration:20000,
                  spinner:'crescent'
                });  
            
                zest.present();
            
                  this.auth.postData(this.userData, "/updateorderstatus").then(
                    result => {
                      zest.dismiss();
                      this.response = result;
                      if(this.response.status == 'success'){
                        this.navCtrl.setRoot(TabsPage);
                        let alert = this.alertCtrl.create({
                          title: "Delivery Done",
                          subTitle: "Thanks For Service",
                          buttons: ["Close"]
                        });
                        alert.present();
                      }
                    },
                    err => {
                      zest.dismiss();
                    }
                  );

              }else{
                let alert = this.alertCtrl.create({
                  title: "Invalid Code",
                  subTitle: "Please Enter Valid Details",
                  buttons: ["Close"]
                });
                alert.present();
              }
            }
          }
        ]
      });
      alert.present();
    }
}
