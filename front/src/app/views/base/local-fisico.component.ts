import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from  '@angular/forms';
import { AuthService } from  '../../auth.service';
import { ApiServiceService } from  '../../api-service.service';

@Component({
  templateUrl: 'local-fisico.component.html'
})
export class LocalFisicoComponent implements OnInit {
  constructor( private authService: AuthService,
               private router: Router,
               private formBuilder: FormBuilder,
               private api: ApiServiceService,
               private auth: AuthService ) { }
  
  private apiUrl: string = 'local_fisicos';
  private item_id: number;
  private data: any;
  private style_message: string;
  private locais: any;
  private used: any;
  private newForm: Boolean = false;
  private editForm: Boolean = false;
  private mainForm: Boolean = true;
  public erroCapturado: boolean;
  public errorMenssage: string;
  public message : string;
  newLocalForm: FormGroup;
  editLocalForm: FormGroup;

  ngOnInit() {
    if (!this.auth.isLoggedIn()){
      alert('Faça login para acessar essa página!');
      this.router.navigate(['login']);
    }

    this.newLocalForm = this.formBuilder.group({
      nome: ['', Validators.required],
      descricao: ['', Validators.required]
    });

    this.editLocalForm = this.formBuilder.group({
      nome: ['', Validators.required],
      descricao: ['', Validators.required]
    });

    this.getLocal();

    this.newForm = false;
  }

  get formControls() {
    return this.newLocalForm.controls;
  }

  // get all

  getLocal(){
    this.api.get(this.apiUrl)
      .subscribe(
        res => this.data = res
      );
  }

  newLocal(e){
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
            local_fisico: {
              nome:             this.newLocalForm.value.nome,
              fazenda_id:      1,
              descricao:    this.newLocalForm.value.descricao
            }
          })
          .subscribe(
            data => {
              console.log("Post request is sucessful", data);
              this.message = "Local criado com sucesso!";
              this.getLocal();
            },
            error => {
              console.log("Error", error);
              this.message = "Não foi possível criar o novo registro.";
            }
          );
      }
    } catch(e){
      this.message = "Ocorreu um erro ao tentar criar o novo registro";
    }

    this.newLocalForm.reset();

    this.getLocal();
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

  editLocal(id){
    this.message = "";

    try{
      if ( this.editForm ) {
        this.api.patch(this.apiUrl + "/" + id, {
            local_fisico: {
              nome:             this.editLocalForm.value.nome,
              fazenda_id:      1,
              descricao:    this.editLocalForm.value.descricao
            }
          })
          .subscribe(
            data => {
              console.log("Patch request is sucessful", data);
              this.message = "Local editado com sucesso!";
              this.getLocal();
            },
            error => {
              console.log("Error", error);
              this.message = "Não foi possível editar o registro.";
            }
          );
      }
    } catch(e){
      this.message = "Erro ao tentar editar o registro";
    }

    this.editLocalForm.reset();
    
    this.editForm = false;
    this.mainForm = true;

    this.getLocal();
  }

  deleteLocal(id){
    this.message = "";

    try{
      this.api.delete(this.apiUrl + "/" + id)
        .subscribe(
          data  => {
          console.log("Delete request is successful ", data);
          this.getLocal();
          this.message = "Local físico deletado com sucesso!";
        },
        error  => {
          console.log("Error", error);
          this.message = "Não foi possível deletar o registro.";
        }
        
      );
    } catch(e){
      this.message = "Ocorreu um erro ao tentar deletar o registro";
    }

    this.getLocal();
  }

  cancel(){
    this.newForm = false;
    this.editForm = false;
    
    this.mainForm = true;

    this.newLocalForm.reset();
    this.editLocalForm.reset();
  }
}
