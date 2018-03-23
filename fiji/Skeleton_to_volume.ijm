//Convert vector  to neuron via blur 
//Used to plot PNs with Split-GAL4 images  
	
	run("32-bit");
	run("Gaussian Blur 3D...", "x=2 y=2 z=2");
	resetMinAndMax();
	run("8-bit"); 