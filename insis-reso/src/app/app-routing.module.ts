import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AcceuilComponent } from './acceuil/acceuil.component';
import { ConnexionComponent } from './connexion/connexion.component';
import { ContactComponent } from './contact/contact.component';
import { DescriptionEqtComponent } from './description-eqt/description-eqt.component';
import { EquipementsComponent } from './equipements/equipements.component';
import { FicheEqtComponent } from './fiche-eqt/fiche-eqt.component';
import { MentionsComponent } from './mentions/mentions.component';
import { NosServicesComponent } from './nos-services/nos-services.component';
import { RealisationsComponent } from './realisations/realisations.component';

const routes: Routes = [
  {path: 'acceuil', component: AcceuilComponent},
  {path: 'contact', component: ContactComponent},
  {path: 'description-eqt', component: DescriptionEqtComponent},
  {path: 'equipements', component: EquipementsComponent},
  {path: 'fiche-eqt', component: FicheEqtComponent},
  {path: 'mentions', component: MentionsComponent},
  {path: 'realisations', component: RealisationsComponent},
  {path: 'services', component: NosServicesComponent},
  {path: 'connexion', component: ConnexionComponent},
  {path: '**', component: AcceuilComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
