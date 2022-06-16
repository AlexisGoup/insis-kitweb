import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FrontPlateformeComponent } from './front-plateforme.component';

describe('FrontPlateformeComponent', () => {
  let component: FrontPlateformeComponent;
  let fixture: ComponentFixture<FrontPlateformeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FrontPlateformeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FrontPlateformeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
