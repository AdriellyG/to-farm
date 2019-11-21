import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from  '@angular/forms';
import { AuthService } from  '../../auth.service';
import { ApiServiceService } from  '../../api-service.service';

@Component({
  templateUrl: 'cultivo.component.html'
})
export class CultivoComponent implements OnInit {
  constructor( private authService: AuthService,
               private router: Router,
               private formBuilder: FormBuilder,
               private api: ApiServiceService,
               private auth: AuthService ) { }
  
  private apiUrl: string = 'cultivos';
  private item_id: number;
  private data: any;
  private locais: any;
  private cultivos: any;
  private cultivo_id: any;
  private newForm: Boolean = false;
  private editForm: Boolean = false;
  private mainForm: Boolean = true;
  public erroCapturado: boolean;
  public errorMenssage: string;
  newCultivoForm: FormGroup;
  editCultivoForm: FormGroup;

  ngOnInit() {
    if (!this.auth.isLoggedIn()){
      alert('Faça login para acessar essa página!');
      this.router.navigate(['login']);
    }

    this.newCultivoForm = this.formBuilder.group({
      nome: ['', Validators.required],
      tipoCultivo: ['', Validators.required]
    });

    this.editCultivoForm = this.formBuilder.group({
      nome: ['', Validators.required],
      tipoCultivo: ['', Validators.required]
    });

    this.getCultivo();
    this.getTipoCultivo();

    //this.getTipoCultivoId(1);

    this.newForm = false;
  }

  get formControls() {
    return this.newCultivoForm.controls;
  }

  // get all

  getCultivo(){
    this.api.get(this.apiUrl)
      .subscribe(
        res => this.data = res
      );
  }

  getTipoCultivo(){
    this.api.get('tipo_cultivos')
      .subscribe(
        res => this.cultivos = res
      );
  }

  // get id

  getTipoCultivoId(id){
    this.api.get('tipo_cultivos' + "/" + id)
      .subscribe(
        res => this.cultivo_id = res
      );
  }

  newCultivo(e){
    this.newForm = !this.newForm;
    
    if ( this.newForm ) {
      this.mainForm = false;
    } else {
      this.mainForm = true;
    }

    if (!this.newForm ) {
      this.api.post(this.apiUrl, {
          cultivo: {
            nome:             this.newCultivoForm.value.nome,
            fazendas_id:      1,
            tipo_cultivos_id:    this.newCultivoForm.value.tipoCultivo
          }
        })
        .subscribe(
          data => {
            console.log("Post request is sucessful", data);
          },
          error => {
            console.log("Error", error);
          }
        );
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

  editCultivo(id){
    if ( this.editForm ) {
      this.api.patch(this.apiUrl + "/" + id, {
          nome: this.newCultivoForm.value.nome,
          fazenda_id: 1,
          tipo_cultivo_id: this.newCultivoForm.value.tipoCultivo,
        })
        .subscribe(
          data => {
            console.log("Patch request is sucessful", data);
          },
          error => {
            console.log("Error", error);
          }
        );
    }

    this.editForm = false;
    this.mainForm = true;
  }

  deleteCultivo(id){
    this.api.delete(this.apiUrl + "/" + id)
        .subscribe(
          data  => {
          console.log("Delete request is successful ", data);
        },
        error  => {
          console.log("Error", error);
        }
      
      );
  }
}
