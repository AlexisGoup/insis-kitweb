import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AcceuilComponent } from './acceuil/acceuil.component';
import { ContactComponent } from './contact/contact.component';
import { DescriptionEqtComponent } from './description-eqt/description-eqt.component';
import { EquipementsComponent } from './equipements/equipements.component';
import { FicheEqtComponent } from './fiche-eqt/fiche-eqt.component';
import { MentionsComponent } from './mentions/mentions.component';
import { RealisationsComponent } from './realisations/realisations.component';
import { TemplatesModule } from './templates/templates.module';
import { ConnexionComponent } from './connexion/connexion.component';
import { NosServicesComponent } from './nos-services/nos-services.component';
import { FormsModule } from '@angular/forms';
import { ToastrModule } from 'ngx-toastr';

@NgModule({
  declarations: [
    AppComponent,
    AcceuilComponent,
    ContactComponent,
    DescriptionEqtComponent,
    EquipementsComponent,
    FicheEqtComponent,
    MentionsComponent,
    RealisationsComponent,
    ConnexionComponent,
    NosServicesComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    TemplatesModule,
    FormsModule,
    BrowserAnimationsModule,
    ToastrModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
