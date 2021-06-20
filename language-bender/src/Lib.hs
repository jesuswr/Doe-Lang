module Lib
    (   langBender,
    ) where


import              System.Environment
import              FrontEnd.CommandLine
import              FrontEnd.Lexer
import              FrontEnd.Parser
import              FrontEnd.Errors
import              FrontEnd.StaticAnalysis as SE
import qualified    Utils.Constants
import qualified    Control.Monad as CM

langBender :: IO ()
langBender = do
    args <- getArgs
    procArgs <- processArgs args
    case procArgs of
        Left cliError -> do
            print cliError
        Right (Result opts warnings) -> do

            CM.when (not $ null warnings) $ do
                putStrLn "lbend CLI warnings:"
                mapM_ print warnings
                putStrLn "\n"

            -- CM.when (help opts) $ print helpMsg

            if help opts then 
                putStrLn helpMsg
            else do

                content <- readFile (fileName opts)

                let lexerResult = scanTokens content
                let lexerErrors = fst lexerResult
                let tokens = snd lexerResult

                CM.unless (null lexerErrors) $ do
                    putStrLn "~ Lexer Errors ~\n"
                    mapM_ print lexerErrors
                    putStrLn "\n"

                CM.when (printLex opts || justLex opts) $ do
                    putStrLn "~ Tokens ~\n"
                    mapM_ print tokens
                    putStrLn "\n"

                if justLex opts then return ()
                    else do

                        let ast = parseTokens tokens

                        CM.when (printPar opts || justPar opts) $ do
                            putStrLn "~ Abstract Syntax Tree ~\n"
                            print ast

                            (symT, stErr) <- SE.analyzeProgram ast

                            CM.unless (null stErr) $ do
                                putStrLn "~ Static Errors ~"
                                print stErr

                        if justPar opts 
                            then return ()
                            else do
                                putStrLn "~ Symbol Table ~"
                                print "ststst"





helpMsg :: String
helpMsg = "~ lbend ~ A language bender compiler.\n"
    ++ "Usage: stack exec -- lbend <bend file> [options]\n"
    ++ "Options:\n"
    ++ "--help         show this help.\n"
    ++ "-lex           print lexer output.\n"
    ++ "-par           print parser output.\n"
    ++ "-jlex          just use the Lexer in the input.\n"
    ++ "-jpar          just use the Lexer and the Parser in the input.\n"
    ++ "-o <file>      Place the output into <file>."