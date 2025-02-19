package com.model;

public class Circulo {

		private double radio;
		public static final double pi = 3.141592;
		
		public Circulo() {
			super();
			this.radio= 1;
		}
		
		public Circulo(double radio) {
			this.radio= radio;
		}

		
		public double getRadio() {
			return radio;
		}

		public void setRadio(double otro) {
			this.radio = otro;
		}
		
		public double calcularArea(double radio) {
			return pi * Math.pow(radio, 2);
		}
		
		public double calcularParametro(double radio) {
			return 2 * pi * radio;
		}

		
		
}
