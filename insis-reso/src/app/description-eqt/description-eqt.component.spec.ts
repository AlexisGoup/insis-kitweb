import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DescriptionEqtComponent } from './description-eqt.component';

describe('DescriptionEqtComponent', () => {
  let component: DescriptionEqtComponent;
  let fixture: ComponentFixture<DescriptionEqtComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DescriptionEqtComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DescriptionEqtComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
