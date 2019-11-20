import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from  '@angular/forms';
import { Router } from  '@angular/router';
//import { User } from  '../user';
//import {MatDialogModule} from '@angular/material/dialog';

import { AuthService } from  '../../auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  constructor( private authService: AuthService,
               private router: Router,
               private formBuilder: FormBuilder ) { }

  loginForm: FormGroup;
  isSubmitted  =  false;
  public auth: any;
  private item: any;
  data: any;

  ngOnInit() {
    this.loginForm  =  this.formBuilder.group({
      email: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  get formControls() {
    return this.loginForm.controls;
  }

  login(e){
    this.authService.getAuth(this.loginForm.value.email, /*btoa(encodeURIComponent(*/this.loginForm.value.password)/*))*/
      .subscribe(
        data => {
          // login successful if there's a jwt token in the response
          if (data && data['auth_token']) {
            // store email and jwt token in local storage to keep user logged in between page refreshes
            sessionStorage.setItem('auth_token_json', JSON.stringify({ token: data['auth_token'] }));
            sessionStorage.setItem('auth_token', data['auth_token']);
          }
          this.router.navigate(['/dashboard']);
          //this.router.navigate(['/tipo-cultivo']);
        },
        error => {
          if (error.status === 401) {
            this.msg('Usuário ou senha inválida!');
          } else {
            this.msg('Ocorreu um erro na autenticação do usuário !');
          }
        }
      );
    
    this.isSubmitted = true;
    // if(this.loginForm.invalid){
    //  return;
    //}
    // this.authService.login(this.loginForm.value);
  }

  msg(m) {
    alert(m);
  }
}

