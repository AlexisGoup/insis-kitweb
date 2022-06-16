import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CompteComponent } from './compte/compte.component';
import { ConnexionComponent } from './connexion/connexion.component';
import { ContactComponent } from './contact/contact.component';
import { EditEquipementComponent } from './edit-equipement/edit-equipement.component';
import { EditPlateformeComponent } from './edit-plateforme/edit-plateforme.component';
import { EditReseauComponent } from './edit-reseau/edit-reseau.component';
import { FrontEquipementComponent } from './front-equipement/front-equipement.component';
import { FrontHomeComponent } from './front-home/front-home.component';
import { FrontPlateformeComponent } from './front-plateforme/front-plateforme.component';
import { FrontReseauComponent } from './front-reseau/front-reseau.component';
import { AdminGuard } from './guards/admin.guard';
import { AuthenficationGuard } from './guards/authenfication.guard';
import { HomeComponent } from './home/home.component';
import { ListEquipementsComponent } from './list-equipements/list-equipements.component';
import { ListPlateformesComponent } from './list-plateformes/list-plateformes.component';
import { MentionsComponent } from './mentions/mentions.component';
import { NewEquipementComponent } from './new-equipement/new-equipement.component';

const routes: Routes = [
  {path: "acceuil", component: FrontHomeComponent},
  {path: "reseau/:id", component: FrontReseauComponent},
  {path: "plateforme/:id", component: FrontPlateformeComponent},
  {path: "equipement/:id", component: FrontEquipementComponent},
  {path: "reseaux", component: HomeComponent, canActivate : [AuthenficationGuard]},
  {path: "login", component: ConnexionComponent},
  {path: "plateformes/:id", component: ListPlateformesComponent, canActivate: [AuthenficationGuard]},
  {path: "equipements/:id_reseau/:id_plateforme", component: ListEquipementsComponent, canActivate: [AuthenficationGuard]},
  {path: "compte", component: CompteComponent, canActivate: [AuthenficationGuard]},
  {path: "edit-reseau/:id", component : EditReseauComponent, canActivate: [AuthenficationGuard, AdminGuard]},
  {path: "edit-plateforme/:id", component: EditPlateformeComponent, canActivate: [AuthenficationGuard, AdminGuard]},
  {path: "edit-equipement/:id", component: EditEquipementComponent, canActivate: [AuthenficationGuard]},
  {path: "new-equipement/:id_reseau/:id_plateforme", component: NewEquipementComponent, canActivate: [AuthenficationGuard]},
  {path: "contact", component: ContactComponent},
  {path: "mentions", component: MentionsComponent},
  {path: "**", component: FrontHomeComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
