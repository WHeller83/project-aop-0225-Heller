package pkg2;

public aspect TraceAspect {
	//Within(Circle) tells us to look in the circle class
   pointcut classToTrace(): within(Circle);
   //This tells us to look at the classToTrace pointcut and any method with the specified signature
   //NOTE: exectution() takes a regular expression as an arg
   pointcut methodToTrace():  classToTrace() &&  execution(double area(double));

   //This is called before we call the pointcut method (area)
   before(): methodToTrace() {
      String info = 
    		  //Signature shows the method's location and args
    		  thisJoinPointStaticPart.getSignature() + ", " 
    		  //getFile shows the method's package tree
            + thisJoinPointStaticPart.getSourceLocation().getFileName() + ", " 
              //getLine gets the line the method is on
            + thisJoinPointStaticPart.getSourceLocation().getLine();
      System.out.println("\t-->" + info);
   }
   
   //This is called after the pointcut method
   after(): methodToTrace() {
      System.out.println("\t<--" + thisJoinPointStaticPart.getSignature());
   }
}
