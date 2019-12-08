import { Injectable } from '@angular/core';
import { User } from './user';
import { ApiServiceService } from  './api-service.service';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Http, URLSearchParams } from '@angular/http';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private params;
  private apiPath: string;
  public formato: string;
  public fileType: string;
  public erroCapturado: boolean;
  public errorMenssage: string;

  constructor( private http: HttpClient,
               private exportHttp: Http,
               private api: ApiServiceService,
               private router: Router ) { }
  
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
  
  // traz o token
  getAuthToken(){
    var session = sessionStorage.getItem('auth_token');
    
    return session;
  }

  // faz requisição para o back, e autoriza ou não
  getAuth(email?, password?) {
    try {
      this.apiPath = 'auth/login';
      
      this.setParams('httpclient', email, password);

      return this.api.get(this.apiPath, this.params, true);
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
    console.log("auth_token: ", sessionStorage.getItem('auth_token'));
    return sessionStorage.getItem('auth_token') !== null;

  }

  public logout(){
    localStorage.removeItem('auth_token');
    this.router.navigate(['/login']);
  }
}