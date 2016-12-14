package com.pas.cloud.web;

public class B {
	public static String s2 = 
			  "\nLauncher"
			+ "\n├─ Xcode"
			+ "\n│  ├─ Simulator"
			+ "\n│  └─ Debugger"
			+ "\n│     ├─ Simulator"
			+ "\n│     └─ Debugger"
			+ "\n├─ Finder"
			+ "\n│  └─ Simulator"
			+ "\n└─ QQ";

	public static void main(String[] args) {
		System.out.println(s2);
		System.out.println("-------------------------------------------");
		Process p = new Process();
		p=p.initFromDumpString(s2);
//		System.out.println("--------------->"+p.getName());
	}

}
