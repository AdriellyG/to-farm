import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from  '../../auth.service';
import { ApiServiceService } from  '../../api-service.service';

@Component({
  templateUrl: 'colheita.component.html'
})
export class ColheitaComponent implements OnInit {
  constructor( private authService: AuthService,
               private router: Router,
               private api: ApiServiceService,
               private auth: AuthService ) { }
  
  private apiUrl: string = 'colheitas';
  
  private data: any;
  public erroCapturado: boolean;
  public errorMenssage: string;

  ngOnInit() {
    if (!this.auth.isLoggedIn()){
      alert('Faça login para acessar essa página!');
      this.router.navigate(['login']);
    }
    this.getColheita();
  }

  // get all
  getColheita(){
    this.api.get(this.apiUrl)
      .subscribe(
        res => this.data = res
      );
  }

  // get week
  getColheitaWeek(){
    this.api.get('colheitas_week')
      .subscribe(
        res => this.data = res
      );
  }

  // get day
  getColheitaDay(){
    this.api.get('colheitas_day')
      .subscribe(
        res => this.data = res
      );
  }

  // get month
  getColheitaMonth(){
    this.api.get('colheitas_month')
      .subscribe(
        res => this.data = res
      );
  }

  // get year
  getColheitaYear(){
    this.api.get('colheitas_year')
      .subscribe(
        res => this.data = res
      );
  }
}
