public aspect TraceAspectHeller {
	
	pointcut ClassToTrace(): within(*App);
	pointcut MethodToTrace(): ClassToTrace() && execution(String getName());

	before(): MethodToTrace(){
		String info = 
	    		  //getSignature shows the aspect's location and args
	    		  thisJoinPointStaticPart.getSignature() + ", " 
	              //getLine gets the line the aspect's is on
	            + thisJoinPointStaticPart.getSourceLocation().getLine();
	      System.out.println("[BGN] " + info);
	}
	
	after(): MethodToTrace(){ 
			//getFileName gets the name of the file the aspect is located within
	      System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
}