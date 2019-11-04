import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from  '@angular/forms';
import { Router } from  '@angular/router';
import { User } from  '../user';

import { AuthService } from  '../auth.service';

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
  public dataSourceEvents: any;
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
    var a = this.authService.getAuth(this.loginForm.value.email, this.loginForm.value.password)
    .subscribe(res => (this.dataSourceEvents = res['data']));
    //.subscribe(res => this.data = res);

    console.log(a); // teste
    
    this.isSubmitted = true;
    if(this.loginForm.invalid){
      return;
    }
    this.authService.login(this.loginForm.value);
    //this.router.navigateByUrl('/dashboard');
  }

}
