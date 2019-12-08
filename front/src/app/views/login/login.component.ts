import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from  '@angular/forms';
import { Router } from  '@angular/router';

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
    this.authService.getAuth(this.loginForm.value.email, this.loginForm.value.password)
      .subscribe(
        data => {
          // loga com sucesso se o jwt token obter resposta valida
          if (data && data['auth_token']) {
            // armazena token para que o usuário possa permanecer logado e fazer requisições para a API
            sessionStorage.setItem('auth_token_json', JSON.stringify({ token: data['auth_token'] }));
            sessionStorage.setItem('auth_token', data['auth_token']);
          }
          this.router.navigate(['/dashboard']);
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
  }

  msg(m) {
    alert(m);
  }
}

