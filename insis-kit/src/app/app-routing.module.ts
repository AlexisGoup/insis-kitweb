import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CompteComponent } from './compte/compte.component';
import { ConnexionComponent } from './connexion/connexion.component';
import { ContactComponent } from './contact/contact.component';
import { EditReseauComponent } from './edit-reseau/edit-reseau.component';
import { AdminGuard } from './guards/admin.guard';
import { AuthenficationGuard } from './guards/authenfication.guard';
import { HomeComponent } from './home/home.component';
import { ListEquipementsComponent } from './list-equipements/list-equipements.component';
import { ListPlateformesComponent } from './list-plateformes/list-plateformes.component';
import { MentionsComponent } from './mentions/mentions.component';

const routes: Routes = [
  {path: "reseaux", component: HomeComponent, canActivate : [AuthenficationGuard]},
  {path: "login", component: ConnexionComponent},
  {path: "plateformes/:id", component: ListPlateformesComponent, canActivate: [AuthenficationGuard]},
  {path: "equipements/:nom/:id", component: ListEquipementsComponent, canActivate: [AuthenficationGuard]},
  {path: "compte", component: CompteComponent, canActivate: [AuthenficationGuard]},
  {path: "edit-reseau/:id", component : EditReseauComponent, canActivate: [AuthenficationGuard, AdminGuard]},
  {path: "contact", component: ContactComponent},
  {path: "mentions", component: MentionsComponent},
  {path: "**", component: ConnexionComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
