Import a nested xml file with variable number of records at various levels                                
                                                                                                          
StackOverflow                                                                                             
https://tinyurl.com/y73hdf36                                                                              
https://stackoverflow.com/questions/62054531/r-xml-parsing-to-data-frame                                  
                                                                                                          
Related Repos                                                                                             
https://github.com/rogerjdeangelis?tab=repositories&q=xml&type=&language=                                 
                                                                                                          
*_                   _                                                                                    
(_)_ __  _ __  _   _| |_                                                                                  
| | '_ \| '_ \| | | | __|                                                                                 
| | | | | |_) | |_| | |_                                                                                  
|_|_| |_| .__/ \__,_|\__|                                                                                 
        |_|                                                                                               
;                                                                                                         
                                                                                                          
filename ft15f001 "d:/xml/fruit.xml";                                                                     
parmcards4;                                                                                               
<ProducedFruits>                                                                                          
  <FruitType>                                                                                             
    <FruitName>Apple</FruitName>                                                                          
    <FruitMetrics>                                                                                        
      <Properties Sugars="27.51" Rate="5.03" />                                                           
      <Properties Sugars="219.39" Rate="12.19" />                                                         
      <Properties Sugars="266.34" Rate="75.9" />                                                          
    </FruitMetrics>                                                                                       
  </FruitType>                                                                                            
  <FruitType>                                                                                             
    <FruitName>Lime</FruitName>                                                                           
    <FruitMetrics>                                                                                        
      <Properties Sugars="1884.2" Rate="5" />                                                             
      <Properties Sugars="1884.2" Rate="98.3" />                                                          
    </FruitMetrics>                                                                                       
  </FruitType>                                                                                            
  <FruitType>                                                                                             
    <FruitName>Lemon</FruitName>                                                                          
    <FruitMetrics>                                                                                        
      <Properties Sugars="1064.77" Rate="5" />                                                            
      <Properties Sugars="1064.77" Rate="56" />                                                           
    </FruitMetrics>                                                                                       
  </FruitType>                                                                                            
  <FruitType>                                                                                             
    <FruitName>Banana</FruitName>                                                                         
    <FruitMetrics>                                                                                        
      <Properties Sugars="113" Rate="12" />                                                               
      <Properties Sugars="113" Rate="79" />                                                               
    </FruitMetrics>                                                                                       
  </FruitType>                                                                                            
</ProducedFruits>                                                                                         
;;;;                                                                                                      
run;quit;                                                                                                 
                                                                                                          
*            _               _                                                                            
  ___  _   _| |_ _ __  _   _| |_                                                                          
 / _ \| | | | __| '_ \| | | | __|                                                                         
| (_) | |_| | |_| |_) | |_| | |_                                                                          
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                         
                |_|                                                                                       
;                                                                                                         
                                                                                                          
WORK.WANTFIX total obs=9                                                                                  
                                                                                                          
  FRUITNAME    RATE       SUGARS                                                                          
                                                                                                          
   Apple       27.51      5.03                                                                            
   Apple       219.39     12.19                                                                           
   Apple       266.34     75.9                                                                            
   Lime        1884.2     5                                                                               
   Lime        1884.2     98.3                                                                            
   Lemon       1064.77    5                                                                               
   Lemon       1064.77    56                                                                              
   Banana      113        12                                                                              
   Banana      113        79                                                                              
                                                                                                          
*                                                                                                         
 _ __  _ __ ___   ___ ___  ___ ___                                                                        
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                       
| |_) | | | (_) | (_|  __/\__ \__ \                                                                       
| .__/|_|  \___/ \___\___||___/___/                                                                       
|_|                                                                                                       
;                                                                                                         
                                                                                                          
proc datasets lib=work nolist;                                                                            
delete want;                                                                                              
run;quit;                                                                                                 
                                                                                                          
%utlfkil(d:/xpt/want.xpt);* just in case it exists and R fails;                                           
                                                                                                          
%utl_submit_r64('                                                                                         
library(XML);                                                                                             
library(plyr);                                                                                            
library(dplyr);                                                                                           
library(SASxport);                                                                                        
library(data.table);                                                                                      
dat  <- XML::xmlParse("d:/xml/fruit.xml");                                                                
want <- unlist(XML::xmlToList(dat), use.names = TRUE, recursive = TRUE);                                  
want <- lapply(want, function(x) if(is.factor(x)) as.character(x) else x);                                
want <- ldply(want, as.data.frame);                                                                       
want <- as.data.table(lapply(want, function(x) if(is.factor(x)) as.character(x) else x));                 
colnames(want)<-c("name","value");                                                                        
write.xport(want,file="d:/xpt/want.xpt");                                                                 
');                                                                                                       
                                                                                                          
libname xpt xport "d:/xpt/want.xpt";                                                                      
                                                                                                          
data want;                                                                                                
                                                                                                          
  retain fruitname "           " rate "           ";                                                      
  set xpt.want;                                                                                           
  name=scan(name,-1,'.');                                                                                 
  if name="FruitName" then do; fruitname=value; delete; end;                                              
  select (name);                                                                                          
    when ("FruitName") do; fruitname=value; delete; end;                                                  
    when ("Sugars")    rate=value;                                                                        
    when ("Rate")  do; Sugars=value; output; end;                                                         
  end;                                                                                                    
  keep fruitname rate sugars;                                                                             
run;quit;                                                                                                 
                                                                                                          
libname xpt clear;                                                                                        
                                                                                                          
                                                                                                          
                                                                                                          
                                                                                                          
                                                                                                          
