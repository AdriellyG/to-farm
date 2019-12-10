import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from  '@angular/forms';
import { AuthService } from  '../../auth.service';
import { ApiServiceService } from  '../../api-service.service';

@Component({
  templateUrl: 'tipo-cultivo.component.html'
})
export class TipoCultivoComponent implements OnInit {
  constructor( private authService: AuthService,
               private router: Router,
               private formBuilder: FormBuilder,
               private api: ApiServiceService,
               private auth: AuthService ) { }

  private apiUrl: string = 'tipo_cultivos';
  private item_id: number;
  private data: any;
  private newForm: Boolean = false;
  private editForm: Boolean = false;
  private mainForm: Boolean = true;
  public erroCapturado: boolean;
  public errorMenssage: string;
  newTypeForm: FormGroup;
  editTypeForm: FormGroup;

  ngOnInit() {
    if (!this.auth.isLoggedIn()){
      alert('Faça login para acessar essa página!');
      this.router.navigate(['login']);
    }

    this.newTypeForm = this.formBuilder.group({
      typeName: ['', Validators.required]
    });

    this.editTypeForm = this.formBuilder.group({
      typeName: ['', Validators.required]
    });

    this.getTipoCultivo();

    this.newForm = false;
  }

  load() {
    //Session storage salva os dados como string
    (sessionStorage.refresh == 'true' || !sessionStorage.refresh) && location.reload();
    sessionStorage.refresh = false;
  }

  get formControls() {
    return this.newTypeForm.controls;
  }

  getTipoCultivo(){
    this.api.get(this.apiUrl)
      .subscribe(
        res => this.data = res
      );
  }

  reload_page(){
    this.data = this.getTipoCultivo();
  }

  newType(e){
    this.newForm = !this.newForm;

    if (!this.newForm ) {
      this.api.post(this.apiUrl, { nome: this.newTypeForm.value.typeName })
        .subscribe(
          data => {
            console.log("Post request is sucessful", data);
            this.reload_page();
          },
          error => {
            console.log("Error", error);
          }
        );
    }

    if ( this.newForm ) {
      this.mainForm = false;
    } else {
      this.mainForm = true;
    }
  }

  setId(id){
    this.editForm = !this.editForm;

    if ( this.editForm ) {
      this.mainForm = false;
    } else {
      this.mainForm = true;
    }
  }

  editType(id){    
    if ( this.editForm ) {
      this.api.patch(this.apiUrl + "/" + id, {nome: this.editTypeForm.value.typeName})
        .subscribe(
          data => {
            console.log("Patch request is sucessful", data);
            this.reload_page();
          },
          error => {
            console.log("Error", error);
          }
        );
    }

    this.editForm = false;
    this.mainForm = true;
  }


  deleteType(id){
    this.api.delete(this.apiUrl + "/" + id)
        .subscribe(
          data  => {
          console.log("Delete request is successful ", data);
          this.reload_page();
        },
        error  => {
          console.log("Error", error);
        }
      
      );
  }
}
