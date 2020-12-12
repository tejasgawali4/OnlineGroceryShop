import { Injectable } from '@angular/core';
import 'rxjs/add/operator/map';
import { Http,Headers } from '@angular/http';

@Injectable()
export class HkApiproviderProvider {

/*   Thanks for Purchase */
/*   Buy App From Envato Get Lifetime Updates*/
/*   Tech Support : Skype : info@scurite.com */

  /*******************************
 *
 *  Developer : Ajay randhawa
 *  Email : ajayrandhawartg@gmail.com
 *
 *  Please don't share this script on nulled websites
 *  Buy from Envato & appreciate Developer
 *
 * ******************************/


 /*******  CHANGE URL HERE ***************/

  url = 'http://localhost';
  static token = '7d8fe3b9199a3fc2573c01ed16b1ba733c60b2d42477a3d559ac2f3375fd5aab';

  // GET ACTIVATION CODE FROM AUTHOR SKYPE : info@scurite.com

 /****************************************/


  baseUrl = this.url + '/onlinegrocerystore/app/';
  data: any;
  imagebaseurl = this.url + '/onlinegrocerystore/admin/itemimg/';
  bannerbaseurl = this.url + '/onlinegrocerystore/admin/banner/';

  /*********************************************** */

  constructor(public http: Http) {
  }


  postData(credentials, type){
    return new Promise((resolve, reject) =>{
      let headers = new Headers();
      this.http.post(this.baseUrl+type, JSON.stringify(credentials), {headers: headers}).
      subscribe(res =>{
        resolve(res.json());
      }, (err) =>{
        reject(err);
      });
    });
  }

  getimage(){
    return this.imagebaseurl;
  }

  getbanner(){
    return this.bannerbaseurl;
  }

  static gettoken(){
    return HkApiproviderProvider.token;
  }

}
