import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, AlertController, LoadingController } from 'ionic-angular';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import 'rxjs/add/operator/map'
import { TabsPage } from '../tabs/tabs';
import { AuthProvider } from '../../providers/auth/auth';


@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {

  userData = {"username" :"", "password":""};
  response:any;

  remember = true ;

  constructor(public auth:AuthProvider ,public navCtrl: NavController, public navParams: NavParams, public http: HttpClient, public alertCtrl:AlertController,public loadingCtrl:LoadingController) {
    if(localStorage.getItem('userLogin')){
      const data = JSON.parse(localStorage.getItem('userLogin'));
      this.userData.username = data.username;
      this.userData.password = data.password
    }
  }


  onLogin(){
    console.log(this.userData);
    let zest = this.loadingCtrl.create({
      content: "Loading...",
      duration:20000,
      spinner:'crescent'
    });  

    if(this.remember == true){
      localStorage.setItem('userLogin', JSON.stringify(this.userData));
    }

    zest.present();

    this.auth.postData(this.userData, "/getauth").then(
      result => {
        zest.dismiss();
        this.response = result;
        console.log(this.response);
        if(this.response.userData){
          localStorage.setItem('UserData', JSON.stringify(this.response.userData) )
          this.navCtrl.setRoot(TabsPage);
        }else{
          let alert = this.alertCtrl.create({
            title: "Invalid Details",
            subTitle: "Please Enter Valid Details",
            buttons: ["Close"]
          });
          alert.present();
        }
      },
      err => {
        console.log(err);
        zest.dismiss();
      }
    );
  }

}
