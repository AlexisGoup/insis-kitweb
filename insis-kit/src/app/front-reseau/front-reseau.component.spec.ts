import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FrontReseauComponent } from './front-reseau.component';

describe('FrontReseauComponent', () => {
  let component: FrontReseauComponent;
  let fixture: ComponentFixture<FrontReseauComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FrontReseauComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FrontReseauComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
