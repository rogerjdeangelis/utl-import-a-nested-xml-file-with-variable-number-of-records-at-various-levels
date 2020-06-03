# utl-import-a-nested-xml-file-with-variable-number-of-records-at-various-levels
    Import a nested xml file with variable number of records at various levels                                   
                                                                                                                 
       Two Solutions                                                                                             
                                                                                                                 
           a. R                                                                                                  
                                                                                                                 
           b. SAS  (uses a simple xmlmap and types the variables)                                                
              Martin, Vincent (STATCAN/STATCAN)                                                                  
              vincent.martin@canada.ca                                                                           
                                                                                                                 
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
               ____                                                                                              
      __ _    |  _ \                                                                                             
     / _` |   | |_) |                                                                                            
    | (_| |_  |  _ <                                                                                             
     \__,_(_) |_| \_\                                                                                            
                                                                                                                 
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
                                                                                                                 
     Variables in Creation Order                                                                                 
                                                                                                                 
    #    Variable     Type    Len                                                                                
                                                                                                                 
    1    FRUITNAME    Char     11                                                                                
    2    RATE         Char     11                                                                                
    3    SUGARS       Char      7                                                                                
                                                                                                                 
    *_                                                                                                           
    | |__     ___  __ _ ___                                                                                      
    | '_ \   / __|/ _` / __|                                                                                     
    | |_) |  \__ \ (_| \__ \                                                                                     
    |_.__(_) |___/\__,_|___/                                                                                     
                                                                                                                 
    ;                                                                                                            
    WORK.WANT    total obs=9                                                                                     
                                                                                                                 
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
                                                                                                                 
     Variables in Creation Order                                                                                 
                                                                                                                 
    #    Variable     Type    Len                                                                                
                                                                                                                 
    1    FRUITNAME    Char     10                                                                                
    2    SUGARS       Num       8                                                                                
    3    RATE         Num       8                                                                                
                                                                                                                 
                                                                                                                 
                                                                                                                 
                                                                                                                 
                                                                                                                 
    *          _       _   _                                                                                     
     ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                     
    / __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                    
    \__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                    
    |___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                    
                                                                                                                 
    ;                                                                                                            
    *                                                                                                            
     _ __  _ __ ___   ___ ___  ___ ___                                                                           
    | '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                          
    | |_) | | | (_) | (_|  __/\__ \__ \                                                                          
    | .__/|_|  \___/ \___\___||___/___/                                                                          
    |_|                                                                                                          
               ____                                                                                              
      __ _    |  _ \                                                                                             
     / _` |   | |_) |                                                                                            
    | (_| |_  |  _ <                                                                                             
     \__,_(_) |_| \_\                                                                                            
                                                                                                                 
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
                                                                                                                 
    *_                                                                                                           
    | |__     ___  __ _ ___                                                                                      
    | '_ \   / __|/ _` / __|                                                                                     
    | |_) |  \__ \ (_| \__ \                                                                                     
    |_.__(_) |___/\__,_|___/                                                                                     
                                                                                                                 
    ;                                                                                                            
                                                                                                                 
    /*                                                                                                           
    While the SAS XML engine isn't the most flexible,                                                            
    this example is fairly straightforward to read directly in SAS using the xml engine.                         
    */                                                                                                           
                                                                                                                 
    data _null_;                                                                                                 
    file "d:\xml\fruits.xml";                                                                                    
    input longstring : $2048.;                                                                                   
    put _INFILE_;                                                                                                
    cards4;                                                                                                      
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
                                                                                                                 
                                                                                                                 
    data _null_;                                                                                                 
            file "d:\xml\fruitmap.map";                                                                          
            input longstring : $2048.;                                                                           
            put _INFILE_;                                                                                        
            cards4;                                                                                              
    <SXLEMAP name="AUTO_GEN" version="2.1">                                                                      
        <TABLE description="fruits" name="fruits">                                                               
            <TABLE-PATH syntax="XPath">/ProducedFruits/FruitType/FruitMetrics/Properties</TABLE-PATH>            
            <COLUMN name="FruitName" retain="yes">                                                               
              <PATH>                                                                                             
                 /ProducedFruits/FruitType/FruitName                                                             
                </PATH>                                                                                          
                <TYPE>character</TYPE>                                                                           
                <DATATYPE>STRING</DATATYPE>                                                                      
                <LENGTH>10</LENGTH>                                                                              
             </COLUMN>                                                                                           
            <COLUMN name="Sugars">                                                                               
              <PATH>                                                                                             
                 /ProducedFruits/FruitType/FruitMetrics/Properties@Sugars                                        
                </PATH>                                                                                          
                <TYPE>numeric</TYPE>                                                                             
                <DATATYPE>float</DATATYPE>                                                                       
                <LENGTH>8</LENGTH>                                                                               
             </COLUMN>                                                                                           
            <COLUMN name="Rate">                                                                                 
              <PATH>                                                                                             
                 /ProducedFruits/FruitType/FruitMetrics/Properties@Rate                                          
                </PATH>                                                                                          
                <TYPE>numeric</TYPE>                                                                             
                <DATATYPE>float</DATATYPE>                                                                       
                <LENGTH>8</LENGTH>                                                                               
             </COLUMN>                                                                                           
        </TABLE>                                                                                                 
    </SXLEMAP>                                                                                                   
    ;;;;                                                                                                         
    run;                                                                                                         
                                                                                                                 
    filename fruitmap "d:\xml\fruitmap.map";                                                                     
    filename fruits "d:\xml\fruits.xml";                                                                         
    libname fruits xmlv2 xmlmap=fruitmap;                                                                        
                                                                                                                 
    libname in "./ProducedFruits/FruitType/FruitMetrics/Properties";                                             
                                                                                                                 
    proc contents data=fruits._all_;                                                                             
    run;quit;                                                                                                    
                                                                                                                 
    data want;                                                                                                   
      set fruits.fruits;                                                                                         
    run;quit;                                                                                                    
    Up to 40 obs WORK.WANT total obs=9                                                                           
                                                                                                                 
    Obs    FRUITNAME     SUGARS     RATE                                                                         
                                                                                                                 
     1      Apple         27.51     5.03                                                                         
     2      Apple        219.39    12.19                                                                         
     3      Apple        266.34    75.90                                                                         
     4      Lime        1884.20     5.00                                                                         
     5      Lime        1884.20    98.30                                                                         
     6      Lemon       1064.77     5.00                                                                         
     7      Lemon       1064.77    56.00                                                                         
     8      Banana       113.00    12.00                                                                         
     9      Banana       113.00    79.00                                                                         
                                                                                                                 
                                                                                                                 
