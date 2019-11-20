import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TipoCultivoComponent } from './tipo-cultivo.component';
import { TipoSoloComponent } from './tipo-solo.component';
import { AreaComponent } from './area.component';

const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Áreas'
    },
    children: [
      {
        path: '',
        redirectTo: 'área1'
      },
      {
        path: 'tipo-cultivo',
        component: TipoCultivoComponent,
        data: {
          title: 'Tipo cultivo'
        }
      },
      {
        path: 'tipo-solo',
        component: TipoSoloComponent,
        data: {
          title: 'Tipo solo'
        }
      },
      {
        path: 'area',
        component: AreaComponent,
        data: {
          title: 'Área'
        }
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BaseRoutingModule {}
