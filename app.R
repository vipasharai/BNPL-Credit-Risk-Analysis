library(shiny)
library(bslib)
library(randomForest)
library(shinyWidgets)

# =========================================
# LOAD MODEL
# =========================================
#setwd("C:/FintechApp")

model <- readRDS("model.rds")

model_cols <- attr(model$terms, "term.labels")

m_levels <- model$forest$xlevels

# =========================================
# UI
# =========================================
ui <- navbarPage(
  
  title = "FINTECH AI",
  id = "main_nav",
  
  theme = bs_theme(
    version = 5,
    bootswatch = "flatly",
    primary = "#334155",
    base_font = font_google("Poppins")
  ),
  
  tags$head(
    
    tags$link(
      rel = "stylesheet",
      href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    ),
    
    tags$style(HTML("
    
    body{
      background:#f8fafc;
      overflow-x:hidden;
      font-family:'Poppins',sans-serif;
    }

    /* NAVBAR */
    .navbar{
      background:linear-gradient(90deg,#0F172A,#1E293B);
      border:none;
      padding:14px 10px;
      box-shadow:0 5px 20px rgba(0,0,0,0.08);
    }

    .navbar-brand{
      color:white !important;
      font-weight:800;
      font-size:1.35rem;
      letter-spacing:1px;
    }

    .nav-link{
      color:white !important;
      font-weight:600;
      margin-right:10px;
    }

    .nav-link:hover{
      color:#cbd5e1 !important;
    }

    /* HERO SECTION */
    .hero-section{
      position:relative;
      padding:120px 20px 110px;
      text-align:center;
      overflow:hidden;
      background:
      linear-gradient(135deg,#0F172A 0%,#1E293B 45%,#334155 100%);
      border-radius:0 0 40px 40px;
      color:white;
    }

    .hero-section::before{
      content:'';
      position:absolute;
      width:500px;
      height:500px;
      background:rgba(255,255,255,0.04);
      border-radius:50%;
      top:-220px;
      left:-150px;
    }

    .hero-section::after{
      content:'';
      position:absolute;
      width:350px;
      height:350px;
      background:rgba(255,255,255,0.04);
      border-radius:50%;
      bottom:-180px;
      right:-100px;
    }

    .hero-title{
      font-size:4.2rem;
      font-weight:800;
      margin-bottom:20px;
      position:relative;
      z-index:2;
    }

    .hero-subtitle{
      max-width:850px;
      margin:auto;
      font-size:1.15rem;
      line-height:1.9;
      color:#e2e8f0;
      position:relative;
      z-index:2;
    }

    .hero-btn{
      margin-top:35px;
      background:white;
      color:#0F172A !important;
      border:none;
      padding:16px 42px;
      border-radius:50px;
      font-weight:700;
      transition:0.3s;
      position:relative;
      z-index:2;
    }

    .hero-btn:hover{
      background:#f1f5f9;
      transform:translateY(-4px);
      box-shadow:0 10px 25px rgba(0,0,0,0.15);
    }

    /* FEATURE CARDS */
    .floating-wrapper{
      margin-top:-60px;
      position:relative;
      z-index:5;
    }

    .floating-card{
      background:white;
      border-radius:24px;
      padding:35px;
      text-align:center;
      height:100%;
      transition:0.35s;
      border:none;
      box-shadow:0 15px 40px rgba(0,0,0,0.06);
    }

    .floating-card:hover{
      transform:translateY(-10px);
      box-shadow:0 25px 50px rgba(0,0,0,0.10);
    }

    .floating-icon{
      width:75px;
      height:75px;
      line-height:75px;
      border-radius:50%;
      margin:auto;
      margin-bottom:20px;
      background:linear-gradient(135deg,#475569,#64748B);
      color:white;
      font-size:2rem;
    }

    .floating-title{
      font-size:1.3rem;
      font-weight:700;
      color:#1E293B;
      margin-bottom:12px;
    }

    .floating-text{
      color:#64748B;
      line-height:1.8;
    }

    /* PREDICTOR */
    .predictor-container{
      background:white;
      border-radius:30px;
      padding:50px;
      margin-top:50px;
      margin-bottom:50px;
      box-shadow:0 20px 50px rgba(0,0,0,0.06);
    }

    .predictor-title{
      font-size:2.2rem;
      font-weight:800;
      color:#1E293B;
      margin-bottom:8px;
    }

    .predictor-sub{
      color:#64748B;
      margin-bottom:35px;
      line-height:1.8;
    }

    .form-control,.selectize-input{
      border-radius:14px !important;
      min-height:50px !important;
      border:1px solid #dbe2ea !important;
      box-shadow:none !important;
    }

    .control-label{
      font-weight:700;
      color:#334155;
      margin-top:14px;
      margin-bottom:8px;
    }

    .predict-btn{
      background:linear-gradient(90deg,#0F172A,#334155);
      color:white !important;
      border:none !important;
      border-radius:16px !important;
      font-weight:700 !important;
      width:100%;
      padding:16px !important;
      margin-top:25px;
      transition:0.3s;
    }

    .predict-btn:hover{
      transform:translateY(-3px);
      box-shadow:0 15px 30px rgba(15,23,42,0.22);
    }

    /* RESULT PANEL */
    .result-panel{
      background:linear-gradient(135deg,#1E293B,#334155);
      border-radius:28px;
      color:white;
      padding:55px 35px;
      min-height:100%;
      position:relative;
      overflow:hidden;
    }

    .result-panel::before{
      content:'';
      position:absolute;
      width:250px;
      height:250px;
      border-radius:50%;
      background:rgba(255,255,255,0.05);
      top:-80px;
      right:-60px;
    }

    .result-head{
      letter-spacing:3px;
      font-size:0.95rem;
      font-weight:700;
      opacity:0.9;
    }

    .result-main{
      font-size:3rem;
      font-weight:800;
      margin:20px 0;
    }

    .result-desc{
      line-height:1.9;
      color:#e2e8f0;
    }

    /* MODEL SECTION */
    .model-section{
      padding-top:40px;
      padding-bottom:40px;
    }

    .model-card{
      background:white;
      border-radius:25px;
      padding:40px;
      box-shadow:0 15px 40px rgba(0,0,0,0.05);
      height:100%;
      transition:0.3s;
    }

    .model-card:hover{
      transform:translateY(-8px);
    }

    .model-icon{
      font-size:2.6rem;
      color:#475569;
      margin-bottom:18px;
    }

    .model-title{
      font-size:1.35rem;
      font-weight:700;
      color:#1E293B;
      margin-bottom:12px;
    }

    .model-text{
      color:#64748B;
      line-height:1.8;
    }

    /* FOOTER */
    .footer{
      background:#0F172A;
      color:white;
      text-align:center;
      padding:35px;
      margin-top:60px;
      border-radius:30px 30px 0 0;
    }

    "))
  ),
  
  # =========================================
  # HOME PAGE
  # =========================================
  tabPanel(
    
    "Home",
    
    div(
      class = "hero-section",
      
      h1(
        class = "hero-title",
        "Smart Credit Risk Intelligence"
      ),
      
      p(
        class = "hero-subtitle",
        
        "A modern AI-powered Buy Now Pay Later analytics platform designed to evaluate customer financial behavior using Machine Learning and Random Forest classification models."
      ),
      
      actionButton(
        "go_predict",
        "Launch Predictor",
        class = "hero-btn"
      )
    ),
    
    div(
      class = "container floating-wrapper",
      
      fluidRow(
        
        column(
          4,
          
          div(
            class = "floating-card",
            
            div(
              class = "floating-icon",
              icon("shield-halved")
            ),
            
            h4(
              class = "floating-title",
              "Fraud Detection"
            ),
            
            p(
              class = "floating-text",
              
              "Detect suspicious repayment patterns and reduce high-risk financial approvals using AI."
            )
          )
        ),
        
        column(
          4,
          
          div(
            class = "floating-card",
            
            div(
              class = "floating-icon",
              icon("chart-line")
            ),
            
            h4(
              class = "floating-title",
              "Predictive Analytics"
            ),
            
            p(
              class = "floating-text",
              
              "Machine learning algorithms analyze customer financial and behavioral features in real-time."
            )
          )
        ),
        
        column(
          4,
          
          div(
            class = "floating-card",
            
            div(
              class = "floating-icon",
              icon("bolt")
            ),
            
            h4(
              class = "floating-title",
              "Instant Decisions"
            ),
            
            p(
              class = "floating-text",
              
              "Generate fast AI-driven credit approval recommendations for fintech ecosystems."
            )
          )
        )
      )
    )
  ),
  
  # =========================================
  # PREDICTOR PAGE
  # =========================================
  tabPanel(
    
    "Predictor",
    
    div(
      class = "container",
      
      div(
        class = "predictor-container",
        
        fluidRow(
          
          # LEFT PANEL
          column(
            5,
            
            h2(
              class = "predictor-title",
              "Customer Assessment"
            ),
            
            p(
              class = "predictor-sub",
              
              "Provide customer financial information to evaluate BNPL repayment risk."
            ),
            
            numericInput(
              "customer_age",
              "Customer Age",
              25
            ),
            
            selectInput(
              "gender",
              "Gender",
              choices = m_levels$Gender.x
            ),
            
            numericInput(
              "annual_income",
              "Annual Income",
              50000
            ),
            
            numericInput(
              "credit_score",
              "Credit Score",
              700
            ),
            
            selectInput(
              "purchase_cat",
              "Purchase Category",
              choices = m_levels$Purchase_Category.x
            ),
            
            selectInput(
              "device_type",
              "Device Type",
              choices = m_levels$Device_Type
            ),
            
            actionButton(
              "predict_btn",
              "Evaluate Risk",
              class = "predict-btn"
            )
          ),
          
          # RIGHT PANEL
          column(
            7,
            
            div(
              class = "result-panel",
              
              div(
                class = "result-head",
                "AI PREDICTION ENGINE"
              ),
              
              div(
                class = "result-main",
                textOutput("risk_result")
              ),
              
              div(
                class = "result-desc",
                textOutput("risk_desc")
              )
            )
          )
        )
      )
    )
  ),
  
  # =========================================
  # MODEL PAGE
  # =========================================
  tabPanel(
    
    "Model",
    
    div(
      class = "container model-section",
      
      fluidRow(
        
        column(
          4,
          
          div(
            class = "model-card",
            
            div(
              class = "model-icon",
              icon("brain")
            ),
            
            h4(
              class = "model-title",
              "Random Forest Model"
            ),
            
            p(
              class = "model-text",
              
              "The platform uses Random Forest ensemble learning for accurate borrower risk classification and financial behavior prediction."
            )
          )
        ),
        
        column(
          4,
          
          div(
            class = "model-card",
            
            div(
              class = "model-icon",
              icon("database")
            ),
            
            h4(
              class = "model-title",
              "Feature Engineering"
            ),
            
            p(
              class = "model-text",
              
              "The model analyzes credit score, income, age, device behavior, and transaction attributes for intelligent decision making."
            )
          )
        ),
        
        column(
          4,
          
          div(
            class = "model-card",
            
            div(
              class = "model-icon",
              icon("chart-pie")
            ),
            
            h4(
              class = "model-title",
              "Risk Intelligence"
            ),
            
            p(
              class = "model-text",
              
              "AI-powered classification improves fintech decision systems by minimizing default exposure and approval risk."
            )
          )
        )
      )
    )
  ),
  
  # =========================================
  # FOOTER
  # =========================================
  footer = div(
    class = "footer",
    
    h4("FINTECH AI"),
    
    p(
      "AI Powered BNPL Credit Intelligence Platform"
    ),
    
    p(
      "Vipasha Rai • MCA Data Science • Lovely Professional University • 2026"
    )
  )
)

# =========================================
# SERVER
# =========================================
server <- function(input, output, session) {
  
  # NAVIGATION
  observeEvent(input$go_predict,{
    
    updateNavbarPage(
      session,
      "main_nav",
      selected = "Predictor"
    )
  })
  
  # PREDICTION
  prediction_res <- eventReactive(
    
    input$predict_btn,{
      
      tryCatch({
        
        df_list <- list()
        
        df_list$Customer_Age.x <- as.numeric(input$customer_age)
        
        df_list$Gender.x <- factor(
          input$gender,
          levels = m_levels$Gender.x
        )
        
        df_list$Annual_Income.x <- as.numeric(input$annual_income)
        
        df_list$Credit_Score.x <- as.numeric(input$credit_score)
        
        df_list$Purchase_Category.x <- factor(
          input$purchase_cat,
          levels = m_levels$Purchase_Category.x
        )
        
        df_list$Device_Type <- factor(
          input$device_type,
          levels = m_levels$Device_Type
        )
        
        # FILL REMAINING COLUMNS
        for(col in model_cols){
          
          if(!(col %in% names(df_list))){
            
            df_list[[col]] <- factor(
              m_levels[[col]][1],
              levels = m_levels[[col]]
            )
          }
        }
        
        input_data <- as.data.frame(df_list)
        
        input_data <- input_data[, model_cols, drop = FALSE]
        
        predict(model,input_data)
        
      }, error = function(e){
        
        return(
          paste("ERROR:",e$message)
        )
      })
    })
  
  # RESULT TEXT
  output$risk_result <- renderText({
    
    res <- prediction_res()
    
    if(is.null(res)){
      
      "READY"
      
    } else if(grepl("ERROR",res)){
      
      "SYSTEM ERROR"
      
    } else if(as.numeric(as.character(res)) == 1){
      
      "HIGH RISK"
      
    } else{
      
      "LOW RISK"    
    }
  })
  
  output$risk_desc <- renderText({
    
    res <- prediction_res()
    
    if(is.null(res)){
      
      "The AI system is ready to evaluate customer financial risk profiles."
      
    } else if(grepl("ERROR",res)){
      
      "The model rejected the supplied values. Please verify all fields."
      
    } else if(as.numeric(as.character(res)) == 1){
      
      "The customer exhibits elevated repayment risk patterns. Manual financial review is recommended before approval."
      
    } else{
      
      "The customer profile aligns with historically reliable repayment behavior and is classified as low financial risk."
    }
  })
}

# =========================================
# RUN APP
# =========================================
shinyApp(ui, server)