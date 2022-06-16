import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FicheEqtComponent } from './fiche-eqt.component';

describe('FicheEqtComponent', () => {
  let component: FicheEqtComponent;
  let fixture: ComponentFixture<FicheEqtComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FicheEqtComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FicheEqtComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
