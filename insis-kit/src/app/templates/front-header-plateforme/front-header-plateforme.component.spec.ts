import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FrontHeaderPlateformeComponent } from './front-header-plateforme.component';

describe('FrontHeaderPlateformeComponent', () => {
  let component: FrontHeaderPlateformeComponent;
  let fixture: ComponentFixture<FrontHeaderPlateformeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FrontHeaderPlateformeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FrontHeaderPlateformeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
