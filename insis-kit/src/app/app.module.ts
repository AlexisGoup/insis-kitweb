import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { TemplatesModule } from './templates/templates.module';
import { ConnexionComponent } from './connexion/connexion.component';
import { FormsModule } from '@angular/forms';
import { ToastrModule } from 'ngx-toastr';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ListPlateformesComponent } from './list-plateformes/list-plateformes.component';
import { ListEquipementsComponent } from './list-equipements/list-equipements.component';
import { CompteComponent } from './compte/compte.component';
import { EditReseauComponent } from './edit-reseau/edit-reseau.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ModalModule } from './modal/modal.module';
import { ContactComponent } from './contact/contact.component';
import { MentionsComponent } from './mentions/mentions.component';
import { EditPlateformeComponent } from './edit-plateforme/edit-plateforme.component';
import { EditEquipementComponent } from './edit-equipement/edit-equipement.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ConnexionComponent,
    ListPlateformesComponent,
    ListEquipementsComponent,
    CompteComponent,
    EditReseauComponent,
    ContactComponent,
    MentionsComponent,
    EditPlateformeComponent,
    EditEquipementComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    TemplatesModule,
    BrowserAnimationsModule,
    FormsModule,
    ToastrModule.forRoot(),
    HttpClientModule,
    NgbModule,
    ModalModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
