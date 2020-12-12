import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import 'rxjs/add/operator/map'

/*   Thanks for Purchase */
/*   Buy App From Envato Get Lifetime Updates*/
/*   Skype : info@scurite.com */

let apiUrl = 'http://localhost/onlinegrocerystore/app';

@Injectable()
export class AuthProvider {

  constructor(public http: HttpClient) {
    console.log('Hello AuthProvider Provider');
  }

  postData(credentials, type){
    let headers = new HttpHeaders();

    return new Promise((resolve, reject) => {
      this.http.post(apiUrl+type, JSON.stringify(credentials), {headers: headers})
        .subscribe(res => {
          resolve(res);
        }, (err) => {
          reject(err);
        });
    });

  }


}
