import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from  '@angular/forms';
import { AuthService } from  '../../auth.service';
import { ApiServiceService } from  '../../api-service.service';
import { stringify } from '@angular/compiler/src/util';

@Component({
  templateUrl: 'area.component.html'
})
export class AreaComponent implements OnInit {
  constructor( private authService: AuthService,
               private router: Router,
               private formBuilder: FormBuilder,
               private api: ApiServiceService,
               private auth: AuthService ) { }
  
  private apiUrl: string = 'areas';
  private item_id: number;
  private data: any;
  private locais: any;
  private solos: any;
  private local_id: any;
  private solo_id: any;
  private message: string;
  private newForm: Boolean = false;
  private editForm: Boolean = false;
  private mainForm: Boolean = true;
  public erroCapturado: boolean;
  public errorMenssage: string;
  newAreaForm: FormGroup;
  editAreaForm: FormGroup;

  ngOnInit() {
    if (!this.auth.isLoggedIn()){
      alert('Faça login para acessar essa página!');
      this.router.navigate(['login']);
    }

    this.newAreaForm = this.formBuilder.group({
      nome: ['', Validators.required],
      tipoSolo: ['', Validators.required],
      localFisico: ['', Validators.required]
    });

    this.editAreaForm = this.formBuilder.group({
      nome: ['', Validators.required],
      tipoSolo: ['', Validators.required],
      localFisico: ['', Validators.required]
    });

    this.getArea();
    this.getTipoSolo();
    this.getLocal();

    this.newForm = false;
  }

  get formControls() {
    return this.newAreaForm.controls;
  }

  // get all

  getArea(){
    this.api.get(this.apiUrl)
      .subscribe(
        res => this.data = res
      );
  }

  getTipoSolo(){
    this.api.get('tipo_solos')
      .subscribe(
        res => this.solos = res
      );
  }

  getLocal(){
    this.api.get('local_fisicos')
      .subscribe(
        res => this.locais = res
      );
  }

  // get id

  getTipoSoloId(id){
    this.api.get('tipo_solos' + "/" + id)
      .subscribe(
        res => this.solo_id = res
      );
  }

  getLocalId(id){
    this.api.get('local_fisicos' + "/" + id)
      .subscribe(
        res => this.local_id = res
      );
  }

  cancel(){
    this.newForm = false;
    this.editForm = false;
    
    this.mainForm = true;

    this.newAreaForm.reset();
    this.editAreaForm.reset();
  }

  newArea(e){
    this.message = "";
    this.newForm = !this.newForm;
    
    if ( this.newForm ) {
      this.mainForm = false;
    } else {
      this.mainForm = true;
    }

    try{
      if (!this.newForm ) {
        this.api.post(this.apiUrl, {
            area: {
              nome:             this.newAreaForm.value.nome,
              fazenda_id:      1,
              tipo_solo_id:    this.newAreaForm.value.tipoSolo,
              local_fisico_id: this.newAreaForm.value.localFisico
            }
          })
          .subscribe(
            data => {
              console.log("Post request is sucessful", data);
              this.message = "Área cadastrada com sucesso!";
              this.getArea();
            },
            error => {
              console.log("Error", error);
              this.message = "Não foi possível cadastrar a nova área";
            }
          );
      }
    } catch(e){
      this.message = "Erro ao tentar cadastrar área.";
    }

    this.newAreaForm.reset();
  }

  setId(id){
    this.message = "";

    this.editForm = !this.editForm;

    if ( this.editForm ) {
      this.mainForm = false;
    } else {
      this.mainForm = true;
    }
  }

  editArea(id){
    this.message = "";

    try {
      if ( this.editForm ) {
        this.api.patch(this.apiUrl + "/" + id, {
          area: {
            nome:            this.editAreaForm.value.nome,
            fazenda_id:      1,
            tipo_solo_id:    this.editAreaForm.value.tipoSolo,
            local_fisico_id: this.editAreaForm.value.localFisico
          }
          })
          .subscribe(
            data => {
              console.log("Patch request is sucessful", data);
              this.message = "Área editada com sucesso!";
              this.getArea();
            },
            error => {
              console.log("Error", error);
              this.message = "Não foi possível editar o registro.";
            }
          );
      }
    } catch (error) {
      this.message = "Erro ao tentar editar o registro.";
    }

    this.editAreaForm.reset();
    this.editForm = false;
    this.mainForm = true;
  }

  deleteArea(id){
    try {
      this.api.delete(this.apiUrl + "/" + id)
      .subscribe(
        data  => {
        console.log("Delete request is successful ", data);
        this.message = "Registro deletado com sucesso!";
        this.getArea();
      },
      error  => {
        console.log("Error", error);
        this.message = "Não foi possível deletar o registro.";
      }
    
    );
    } catch (error) {
      this.message = "Erro ao tentar deletar registro";
    }
  }
}
