import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Http } from '@angular/http';
import { retry, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ApiServiceService {

  constructor(private http: HttpClient, private exportHttp: Http) {  }

  private apiUrl: string = 'http://localhost:3000/api/';
  private headers: HttpHeaders;
  
  getHeaders(isLogin?){

    let headers = new HttpHeaders()
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json');

    if ( !isLogin ) {
      headers = headers.set('Authorization', sessionStorage.getItem('auth_token'));
    }

    return headers;
  }

  post(apiSubUrl, params){
    let http: HttpClient;

    return this.http.post(this.apiUrl + apiSubUrl,
      params,
      {
        headers: this.getHeaders(false)
      }
    );
  }

  get(apiSubUrl, param?, isLogin?){
    let http: HttpClient;

    return this.http
    .get(this.apiUrl + apiSubUrl, {
      headers: this.getHeaders(isLogin),
      params: param
    });
  }

  delete(apiSubUrl, param?){
    let http: HttpClient;

    return this.http
    .delete(this.apiUrl + apiSubUrl, {
      headers: this.getHeaders(false),
      params: param
    });
  }

  patch(apiSubUrl, params){
    let http: HttpClient;

    return this.http.patch(this.apiUrl + apiSubUrl,
      params,
      {
        headers: this.getHeaders(false)
      }
    );
  }
}
