import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { FrontHeaderComponent } from './front-header/front-header.component';
import { FrontHeaderPlateformeComponent } from './front-header-plateforme/front-header-plateforme.component';



@NgModule({
  declarations: [
    HeaderComponent,
    FooterComponent,
    FrontHeaderComponent,
    FrontHeaderPlateformeComponent
  ],
  imports: [
    CommonModule
  ],
  exports : [
    HeaderComponent,
    FooterComponent,
    FrontHeaderComponent
  ]
})
export class TemplatesModule { }
