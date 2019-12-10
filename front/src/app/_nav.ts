interface NavAttributes {
  [propName: string]: any;
}
interface NavWrapper {
  attributes: NavAttributes;
  element: string;
}
interface NavBadge {
  text: string;
  variant: string;
}
interface NavLabel {
  class?: string;
  variant: string;
}

export interface NavData {
  name?: string;
  url?: string;
  icon?: string;
  badge?: NavBadge;
  title?: boolean;
  children?: NavData[];
  variant?: string;
  attributes?: NavAttributes;
  divider?: boolean;
  class?: string;
  label?: NavLabel;
  wrapper?: NavWrapper;
}

export const navItems: NavData[] = [

  {
    title: true,
    name: 'Funções'
  },
  {
    name: 'HOME',
    url: '/dashboard',
    icon: 'icon-puzzle'
  },
  {
    name: 'Tipo Cultivo',
    url: '/base/tipo-cultivo',
    icon: 'icon-puzzle'
  },
  {
    name: 'Cultivo',
    url: '/base/cultivo',
    icon: 'icon-puzzle'
  },
  {
    name: 'Tipo Solo',
    url: '/base/tipo-solo',
    icon: 'icon-puzzle'
  },
  {
    name: 'Local físico',
    url: '/base/local-fisico',
    icon: 'icon-puzzle'
  },
  {
    name: 'Área',
    url: '/base/area',
    icon: 'icon-puzzle'
  },
  {
    name: 'Plantio',
    url: '/base/plantio',
    icon: 'icon-puzzle'
  },
  {
    name: 'Colheita',
    url: '/base/colheita',
    icon: 'icon-puzzle'
  },
  {
    divider: true
  },
  {
    title: true,
    name: 'Extras',
  },
  {
    name: 'Fazendas',
    url: '/pages',
    icon: 'icon-star',
    children: [
      {
        name: 'Login',
        url: 'login',
        icon: 'icon-star'
      },
      {
        name: 'Registro',
        url: '/register',
        icon: 'icon-star'
      }
    ]
  },

];
