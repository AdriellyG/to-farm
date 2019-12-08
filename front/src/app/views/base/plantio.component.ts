import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from  '@angular/forms';
import { AuthService } from  '../../auth.service';
import { ApiServiceService } from  '../../api-service.service';

@Component({
  templateUrl: 'plantio.component.html'
})
export class PlantioComponent implements OnInit {
  constructor( private authService: AuthService,
               private router: Router,
               private formBuilder: FormBuilder,
               private api: ApiServiceService,
               private auth: AuthService ) { }
  
  private apiUrl: string = 'plantios';
  private item_id: number;
  private data: any;
  private areas: any;
  private cultivos: any;
  private status_plantios;
  private newForm: Boolean = false;
  private editForm: Boolean = false;
  private mainForm: Boolean = true;
  public erroCapturado: boolean;
  public errorMenssage: string;
  newPlantioForm: FormGroup;
  editPlantioForm: FormGroup;

  ngOnInit() {
    if (!this.auth.isLoggedIn()){
      alert('Faça login para acessar essa página!');
      this.router.navigate(['login']);
    }

    this.newPlantioForm = this.formBuilder.group({
      dt_inicial: ['', Validators.required],
      dt_final: ['', Validators.required],
      area_id: ['', Validators.required],
      cultivo_id: ['', Validators.required],
      status_plantio_id: ['', Validators.required]
    });

    this.editPlantioForm = this.formBuilder.group({
      dt_inicial: ['', Validators.required],
      dt_final: ['', Validators.required],
      area_id: ['', Validators.required],
      cultivo_id: ['', Validators.required],
      status_plantio_id: ['', Validators.required]
    });

    this.getPlantio();
    this.getCultivo();
    this.getArea();
    this.getStatusPlantio();

    this.newForm = false;
  }

  get formControls() {
    return this.newPlantioForm.controls;
  }

  getPlantio(){
    this.api.get(this.apiUrl)
      .subscribe(
        res => this.data = res
      );
  }

  getArea(){
    this.api.get('areas')
      .subscribe(
        res => this.areas = res
      );
  }

  getCultivo(){
    this.api.get('cultivos')
      .subscribe(
        res => this.cultivos = res
      );
  }

  getStatusPlantio(){
    this.api.get('status_plantios')
      .subscribe(
        res => this.status_plantios = res
      );
  }

  newPlantio(e){
    this.newForm = !this.newForm;

    if ( this.newForm ) {
      this.mainForm = false;
    } else {
      this.mainForm = true;
    }


    if (!this.newForm ) {
      this.api.post(this.apiUrl, {
        dt_inicial:         this.newPlantioForm.value.dt_inicial,
        dt_final:           this.newPlantioForm.value.dt_final,
        areas_id:           this.newPlantioForm.value.area_id,
        cultivos_id:        this.newPlantioForm.value.cultivo_id,
        status_plantios_id: this.newPlantioForm.value.status_plantio_id
      })
        .subscribe(
          data => {
            console.log("Post request is sucessful", data);
            this.getPlantio();
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

  editPlantio(id){
    if ( this.editForm ) {
      this.api.patch(this.apiUrl + "/" + id, {
        dt_inicial:         this.editPlantioForm.value.dt_inicial,
        dt_final:           this.editPlantioForm.value.dt_final,
        areas_id:           this.editPlantioForm.value.area_id,
        cultivos_id:        this.editPlantioForm.value.cultivo_id,
        status_plantios_id: this.editPlantioForm.value.status_plantio_id
        })
        .subscribe(
          data => {
            console.log("Patch request is sucessful", data);
            this.getPlantio();
          },
          error => {
            console.log("Error", error);
          }
        );
    }

    this.editForm = false;
    this.mainForm = true;
  }

  deletePlantio(id){
    this.api.delete(this.apiUrl + "/" + id)
        .subscribe(
          data  => {
          console.log("Delete request is successful ", data);
          this.getPlantio();
        },
        error  => {
          console.log("Error", error);
        }
      
      );
  }
}
