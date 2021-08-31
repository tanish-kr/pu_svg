# frozen_string_literal: true

RSpec.describe PuSvg::Convert do
  describe "#run" do
    let(:plantuml_text) do
      <<-PLANTUML
      Bob -> Alice : hello
      PLANTUML
    end
    let(:result_svg) do
      <<~SVG
                <?xml version="1.0" encoding="UTF-8" standalone="no"?><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" contentScriptType="application/ecmascript" contentStyleType="text/css" height="132px" preserveAspectRatio="none" style="width:125px;height:132px;" version="1.1" viewBox="0 0 125 132" width="125px" zoomAndPan="magnify"><defs><filter height="300%" id="f1ovyoxgkqkxtz" width="300%" x="-1" y="-1"><feGaussianBlur result="blurOut" stdDeviation="2.0"/><feColorMatrix in="blurOut" result="blurOut2" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .4 0"/><feOffset dx="4.0" dy="4.0" in="blurOut2" result="blurOut3"/><feBlend in="SourceGraphic" in2="blurOut3" mode="normal"/></filter></defs><g><line style="stroke:#A80036;stroke-width:1.0;stroke-dasharray:5.0,5.0;" x1="28" x2="28" y1="40.2969" y2="89.4297"/><line style="stroke:#A80036;stroke-width:1.0;stroke-dasharray:5.0,5.0;" x1="88" x2="88" y1="40.2969" y2="89.4297"/><rect fill="#FEFECE" filter="url(#f1ovyoxgkqkxtz)" height="30.2969" style="stroke:#A80036;stroke-width:1.5;" width="43" x="5" y="5"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="29" x="12" y="24.9951">Bob</text><rect fill="#FEFECE" filter="url(#f1ovyoxgkqkxtz)" height="30.2969" style="stroke:#A80036;stroke-width:1.5;" width="43" x="5" y="88.4297"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="29" x="12" y="108.4248">Bob</text><rect fill="#FEFECE" filter="url(#f1ovyoxgkqkxtz)" height="30.2969" style="stroke:#A80036;stroke-width:1.5;" width="49" x="62" y="5"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="35" x="69" y="24.9951">Alice</text><rect fill="#FEFECE" filter="url(#f1ovyoxgkqkxtz)" height="30.2969" style="stroke:#A80036;stroke-width:1.5;" width="49" x="62" y="88.4297"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="35" x="69" y="108.4248">Alice</text><polygon fill="#A80036" points="76.5,67.4297,86.5,71.4297,76.5,75.4297,80.5,71.4297" style="stroke:#A80036;stroke-width:1.0;"/><line style="stroke:#A80036;stroke-width:1.0;" x1="28.5" x2="82.5" y1="71.4297" y2="71.4297"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="30" x="35.5" y="66.3638">hello</text><!--MD5=[0d77474c1654cf3ee00c3164980650ae]
                @startuml
                Bob -> Alice : hello
                @enduml
        #{'        '}
                PlantUML version 1.2021.01beta3(Unknown compile time)
                (GPL source distribution)
                Java Runtime: Java(TM) SE Runtime Environment
                JVM: Java HotSpot(TM) 64-Bit Server VM
                Default Encoding: UTF-8
                Language: en
                Country: US
                --></g></svg>
      SVG
    end
  end
end
