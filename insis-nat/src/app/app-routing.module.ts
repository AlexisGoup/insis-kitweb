import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { NosReseauComponent } from './nos-reseau/nos-reseau.component';

const routes: Routes = [
  // ------ Acceuil ------------
  { path: 'home', component: HomeComponent},
  // ------ Nos Reseaux --------
  { path: 'reseaux', component: NosReseauComponent},
  { path: '**', component: HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
