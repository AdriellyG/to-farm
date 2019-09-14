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
    name: 'Áreas',
    url: '/base',
    icon: 'icon-puzzle',
    children: [
      {
        name: 'Área 1 ',
        url: '/base/cards',
        icon: 'icon-puzzle'
      },
      {
        name: 'Área 2',
        url: '/base/carousels',
        icon: 'icon-puzzle'
      },
      {
        name: 'Área 3',
        url: '/base/collapses',
        icon: 'icon-puzzle'
      },
      {
        name: 'Área 4',
        url: '/base/forms',
        icon: 'icon-puzzle'
      },
    ]
  },
  {
    name: 'Produtos',
    url: '/buttons',
    icon: 'icon-cursor',
    children: [
      {
        name: 'Pinga de Banana',
        url: '/buttons/buttons',
        icon: 'icon-cursor'
      },
      {
        name: 'Doce de Banana',
        url: '/buttons/dropdowns',
        icon: 'icon-cursor'
      }
    ]
  },
  {
    name: 'Colheita',
    url: '/charts',
    icon: 'icon-pie-chart'
  },
  {
    name: 'Pulverização',
    url: '/icons',
    icon: 'icon-star',
    children: [
      {
        name: 'Área 1',
        url: '/icons/coreui-icons',
        icon: 'icon-star',
        badge: {
          variant: 'success',
          text: 'Fazendo'
        }
      },
      {
        name: 'Área 2',
        url: '/icons/flags',
        icon: 'icon-star'
      }
    ]
  },
  {
    name: 'Alertas',
    url: '/notifications',
    icon: 'icon-bell',
    children: [
      {
        name: 'Chegada de pá',
        url: '/notifications/alerts',
        icon: 'icon-bell'
      },
      {
        name: 'Pagamento',
        url: '/notifications/badges',
        icon: 'icon-bell'
      }
    ]
  },
  {
    name: 'Visão Geral',
    url: '/widgets',
    icon: 'icon-calculator'
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
        url: '/login',
        icon: 'icon-star'
      },
      {
        name: 'Registro',
        url: '/register',
        icon: 'icon-star'
      }
    ]
  }
];
