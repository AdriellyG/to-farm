import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TipoCultivoComponent } from './tipo-cultivo.component';
import { TipoSoloComponent } from './tipo-solo.component';
import { AreaComponent } from './area.component';
import { CultivoComponent } from './cultivo.component';
import { LocalFisicoComponent } from './local-fisico.component';
import { PlantioComponent } from './plantio.component';
import { ColheitaComponent } from './colheita.component';

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
      },
      {
        path: 'cultivo',
        component: CultivoComponent,
        data: {
          title: 'Cultivo'
        }
      },
      {
        path: 'local-fisico',
        component: LocalFisicoComponent,
        data: {
          title: 'Locais físicos'
        }
      },
      {
        path: 'plantio',
        component: PlantioComponent,
        data: {
          title: 'Plantios'
        }
      },
      {
        path: 'colheita',
        component: ColheitaComponent,
        data: {
          title: 'Colheitas'
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
