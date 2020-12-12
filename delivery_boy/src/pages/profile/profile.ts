import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, App } from 'ionic-angular';
import { HomePage } from '../home/home';
import { LoginPage } from '../login/login';


@IonicPage()
@Component({
  selector: 'page-profile',
  templateUrl: 'profile.html',
})
export class ProfilePage {

  userDetails:any;

  constructor(public navCtrl: NavController, public navParams: NavParams, private app: App) {
    if(localStorage.getItem('UserData')){
      const data = JSON.parse(localStorage.getItem('UserData'));
      this.userDetails = data;
    }
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ProfilePage');
  }

  
  
  onlogout(){
  this.app.getRootNav().setRoot(LoginPage);
  }
}
