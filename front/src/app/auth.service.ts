import { Injectable } from '@angular/core';
import { User } from './user';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Http, Headers, ResponseContentType, URLSearchParams } from '@angular/http';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private headers;
  private params;
  public apiPath: string;
  public formato: string;
  public fileType: string;
  public erroCapturado: boolean;
  public errorMenssage: string;

  constructor(private http: HttpClient, private exportHttp: Http) { }
  
  private setParams(params, email?, password?) {
    let http: HttpClient;
    try {
      if (params === 'httpclient') {
        this.params = new HttpParams()
        .set('email', email)
        .set('password', password);
      } else {
        this.params = new URLSearchParams();
        this.params.set('email', email);
        this.params.set('password', password);
      }
    } catch (Error) {
      console.log('Service: ', Error);
      this.errorMenssage = Error;
      this.erroCapturado = true;
    }
  }

  getAuth(email?, password?) {
    let http: HttpClient;
    try {
      this.apiPath = 'http://localhost:3000/api/auth/login';
      
      this.setParams('httpclient', email, password);

      this.headers = new HttpHeaders({
        'Content-Type': 'text/plain',
        //'Access-Control-Allow-Origin' : '*',
        //'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'

        //'Content-Type': 'application/json',
        //'Access-Control-Allow-Origin': '*'
        // 'Access-Control-Allow-Origin': 'http://localhost:4200'
      });

      return this.http
      .post(this.apiPath, {
        headers: this.headers,
        params: this.params
      });
    } catch (Error) {
      console.log('Service: ', Error);
      this.errorMenssage = Error;
      this.erroCapturado = true;
    }
  }

  public login(userInfo: User){
    localStorage.setItem('ACCESS_TOKEN', "access_token");
  }

  public isLoggedIn(){
    return localStorage.getItem('ACCESS_TOKEN') !== null;

  }

  public logout(){
    localStorage.removeItem('ACCESS_TOKEN');
  }
}