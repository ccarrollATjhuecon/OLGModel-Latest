(* ::Package:: *)

(*
This file contains various background routines and configurations that are useful for solving dynamic stochastic optimization models
*)

SetSystemOptions["EvaluateNumericalFunctionArgument" -> False];
(* Prevents problematic efforts to evaluate the arguments of numerical functions *)

ParentDirectoryString = "..";SubDirectoryString = $PathnameSeparator;  (* Default for unix *)

(* There are 72 'points' to the inch *)

FullPageSize  = {72. 8.5  ,72. 8.5/GoldenRatio};
HalfPageSize  = {72. 6.5  ,72. 6.5/GoldenRatio};
ThirdPageSize = {72. 4.5  ,72. 4.5/GoldenRatio};
LandscapeSize = {72. 11.0,72. 7.5} //N;

SetOptions[Plot,BaseStyle->{FontSize->14}];
SetOptions[ListPlot,BaseStyle->{FontSize->14}];
SetOptions[Plot,ImageSize->HalfPageSize];
SetOptions[ParametricPlot,ImageSize->HalfPageSize];
SetOptions[ListPlot,ImageSize->HalfPageSize];
SetOptions[ListPlot,PlotStyle->Black];
SetOptions[Plot3D,ImageSize->HalfPageSize];
SetOptions[Plot,PlotStyle->{{Black,Thick},{Black,Thick}}];

(* Put EPS, PNG, PDF versions of figure into directory called Figures *)

ExportFigsToDir[FigName_,DirNameForFigs_] := Block[{},
  Print[Show[ToExpression[FigName]]];
  Print["Exporting figure to "<>DirNameForFigs<>SubDirectoryString<>FigName<>".pdf"];
  Export[DirNameForFigs <> SubDirectoryString <> FigName <> ".eps", ToExpression[FigName], "EPS"];
  Export[DirNameForFigs <> SubDirectoryString <> FigName <> ".png", ToExpression[FigName], "PNG",ImageSize->FullPageSize];
  Export[DirNameForFigs <> SubDirectoryString <> FigName <> ".svg", ToExpression[FigName], "SVG"]; (* SVG version may cause a crash on Windows based systems ! *)
  Export[DirNameForFigs <> SubDirectoryString <> FigName <> ".pdf", ToExpression[FigName], "PDF"];
  If[OpenFigsUsingShell != False, Run["open "<>DirNameForFigs <> SubDirectoryString <> FigName <> ".pdf"]];
];

ExportFigs[FigName_] := ExportFigsToDir[FigName,"../../../Figures"];  (* Figures directory assumed to be three levels up *)

(* Wofram changed the syntax for the Arrow command between versions 5 and 6 *)
(* This function produces the correct syntax depending on which version is being run *)

PhaseArrow[PtStart_,PtEnd_]:=If[$VersionNumber<6
  ,Graphics[Arrow[PtStart,PtEnd,HeadScaling->Relative]]
  ,Graphics[{Thick,Arrowheads[0.025],Arrow[{PtStart,PtEnd}]}]
];
