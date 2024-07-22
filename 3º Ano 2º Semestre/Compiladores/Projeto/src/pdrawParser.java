// Generated from pdraw.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue"})
public class pdrawParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, T__32=33, T__33=34, T__34=35, T__35=36, T__36=37, T__37=38, 
		T__38=39, T__39=40, T__40=41, T__41=42, T__42=43, T__43=44, T__44=45, 
		T__45=46, T__46=47, T__47=48, T__48=49, T__49=50, T__50=51, T__51=52, 
		T__52=53, T__53=54, Type=55, Int=56, Real=57, Bool=58, Color=59, ColorHex=60, 
		Id=61, String=62, Comma=63, Newline=64, Comment=65, Whitespace=66;
	public static final int
		RULE_program = 0, RULE_stat = 1, RULE_penAttribute = 2, RULE_penOptions = 3, 
		RULE_penTypeDef = 4, RULE_penAction = 5, RULE_canvasDef = 6, RULE_penAssignment = 7, 
		RULE_varAssignment = 8, RULE_varDeclaration = 9, RULE_print = 10, RULE_penAlter = 11, 
		RULE_execution = 12, RULE_pause = 13, RULE_if = 14, RULE_canvas_select = 15, 
		RULE_canvas_color = 16, RULE_function_declaration = 17, RULE_function = 18, 
		RULE_until = 19, RULE_for_loop = 20, RULE_expr = 21, RULE_point = 22;
	private static String[] makeRuleNames() {
		return new String[] {
			"program", "stat", "penAttribute", "penOptions", "penTypeDef", "penAction", 
			"canvasDef", "penAssignment", "varAssignment", "varDeclaration", "print", 
			"penAlter", "execution", "pause", "if", "canvas_select", "canvas_color", 
			"function_declaration", "function", "until", "for_loop", "expr", "point"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'{'", "'}'", "'color'", "'='", "'position'", "'orientation'", 
			"'\\u00BA'", "'rad'", "'thickness'", "'pressure'", "'forward'", "'backward'", 
			"'up'", "'down'", "'left'", "'right'", "'pause'", "'define'", "'pen'", 
			"'canvas'", "'new'", "','", "'->'", "'stdout'", "'<-'", "'execute'", 
			"'if'", "'('", "')'", "'select'", "'def'", "'function'", "'functionador'", 
			"'until'", "'for'", "'not'", "'=='", "'<='", "'<'", "'>='", "'>'", "'!='", 
			"'*'", "'/'", "'//'", "'%'", "'**'", "'\\'", "'+'", "'-'", "'and'", "'or'", 
			"'xor'", "'stdin'", null, null, null, null, null, null, null, null, "';'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, "Type", "Int", "Real", "Bool", 
			"Color", "ColorHex", "Id", "String", "Comma", "Newline", "Comment", "Whitespace"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "pdraw.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public pdrawParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(pdrawParser.EOF, 0); }
		public List<StatContext> stat() {
			return getRuleContexts(StatContext.class);
		}
		public StatContext stat(int i) {
			return getRuleContext(StatContext.class,i);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterProgram(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitProgram(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitProgram(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(49);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & 7475975512836145154L) != 0)) {
				{
				{
				setState(46);
				stat();
				}
				}
				setState(51);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(52);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class StatContext extends ParserRuleContext {
		public StatContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_stat; }
	 
		public StatContext() { }
		public void copyFrom(StatContext ctx) {
			super.copyFrom(ctx);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_CanvasDefContext extends StatContext {
		public CanvasDefContext canvasDef() {
			return getRuleContext(CanvasDefContext.class,0);
		}
		public Stat_CanvasDefContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_CanvasDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_CanvasDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_CanvasDef(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_ifContext extends StatContext {
		public IfContext if_() {
			return getRuleContext(IfContext.class,0);
		}
		public Stat_ifContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_if(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_if(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_if(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_function_declarationContext extends StatContext {
		public Function_declarationContext function_declaration() {
			return getRuleContext(Function_declarationContext.class,0);
		}
		public Stat_function_declarationContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_function_declaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_function_declaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_function_declaration(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_canvas_selectContext extends StatContext {
		public Canvas_selectContext canvas_select() {
			return getRuleContext(Canvas_selectContext.class,0);
		}
		public Stat_canvas_selectContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_canvas_select(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_canvas_select(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_canvas_select(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_CurlyContext extends StatContext {
		public List<StatContext> stat() {
			return getRuleContexts(StatContext.class);
		}
		public StatContext stat(int i) {
			return getRuleContext(StatContext.class,i);
		}
		public Stat_CurlyContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_Curly(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_Curly(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_Curly(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_ExecContext extends StatContext {
		public ExecutionContext execution() {
			return getRuleContext(ExecutionContext.class,0);
		}
		public Stat_ExecContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_Exec(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_Exec(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_Exec(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_ExprContext extends StatContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Stat_ExprContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_Expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_Expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_Expr(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_UntilContext extends StatContext {
		public UntilContext until() {
			return getRuleContext(UntilContext.class,0);
		}
		public Stat_UntilContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_Until(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_Until(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_Until(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_ForContext extends StatContext {
		public For_loopContext for_loop() {
			return getRuleContext(For_loopContext.class,0);
		}
		public Stat_ForContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_For(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_For(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_For(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_PenAssignContext extends StatContext {
		public PenAssignmentContext penAssignment() {
			return getRuleContext(PenAssignmentContext.class,0);
		}
		public Stat_PenAssignContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_PenAssign(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_PenAssign(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_PenAssign(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_VarDeclarationContext extends StatContext {
		public VarDeclarationContext varDeclaration() {
			return getRuleContext(VarDeclarationContext.class,0);
		}
		public Stat_VarDeclarationContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_VarDeclaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_VarDeclaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_VarDeclaration(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_VarAssignContext extends StatContext {
		public VarAssignmentContext varAssignment() {
			return getRuleContext(VarAssignmentContext.class,0);
		}
		public Stat_VarAssignContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_VarAssign(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_VarAssign(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_VarAssign(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_PenAlterContext extends StatContext {
		public PenAlterContext penAlter() {
			return getRuleContext(PenAlterContext.class,0);
		}
		public Stat_PenAlterContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_PenAlter(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_PenAlter(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_PenAlter(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_canvas_colorContext extends StatContext {
		public Canvas_colorContext canvas_color() {
			return getRuleContext(Canvas_colorContext.class,0);
		}
		public Stat_canvas_colorContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_canvas_color(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_canvas_color(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_canvas_color(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_PenTypeDefContext extends StatContext {
		public PenTypeDefContext penTypeDef() {
			return getRuleContext(PenTypeDefContext.class,0);
		}
		public Stat_PenTypeDefContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_PenTypeDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_PenTypeDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_PenTypeDef(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_PenAcioContext extends StatContext {
		public PenActionContext penAction() {
			return getRuleContext(PenActionContext.class,0);
		}
		public Stat_PenAcioContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_PenAcio(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_PenAcio(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_PenAcio(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_PrintContext extends StatContext {
		public PrintContext print() {
			return getRuleContext(PrintContext.class,0);
		}
		public Stat_PrintContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_Print(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_Print(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_Print(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_PauseContext extends StatContext {
		public PauseContext pause() {
			return getRuleContext(PauseContext.class,0);
		}
		public Stat_PauseContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_Pause(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_Pause(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_Pause(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_functionContext extends StatContext {
		public FunctionContext function() {
			return getRuleContext(FunctionContext.class,0);
		}
		public Stat_functionContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterStat_function(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitStat_function(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitStat_function(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StatContext stat() throws RecognitionException {
		StatContext _localctx = new StatContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_stat);
		int _la;
		try {
			setState(80);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,2,_ctx) ) {
			case 1:
				_localctx = new Stat_PenTypeDefContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(54);
				penTypeDef();
				}
				break;
			case 2:
				_localctx = new Stat_PenAssignContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(55);
				penAssignment();
				}
				break;
			case 3:
				_localctx = new Stat_PenAcioContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(56);
				penAction();
				}
				break;
			case 4:
				_localctx = new Stat_VarAssignContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(57);
				varAssignment();
				}
				break;
			case 5:
				_localctx = new Stat_VarDeclarationContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(58);
				varDeclaration();
				}
				break;
			case 6:
				_localctx = new Stat_ExecContext(_localctx);
				enterOuterAlt(_localctx, 6);
				{
				setState(59);
				execution();
				}
				break;
			case 7:
				_localctx = new Stat_CanvasDefContext(_localctx);
				enterOuterAlt(_localctx, 7);
				{
				setState(60);
				canvasDef();
				}
				break;
			case 8:
				_localctx = new Stat_PrintContext(_localctx);
				enterOuterAlt(_localctx, 8);
				{
				setState(61);
				print();
				}
				break;
			case 9:
				_localctx = new Stat_canvas_colorContext(_localctx);
				enterOuterAlt(_localctx, 9);
				{
				setState(62);
				canvas_color();
				}
				break;
			case 10:
				_localctx = new Stat_PenAlterContext(_localctx);
				enterOuterAlt(_localctx, 10);
				{
				setState(63);
				penAlter();
				}
				break;
			case 11:
				_localctx = new Stat_PauseContext(_localctx);
				enterOuterAlt(_localctx, 11);
				{
				setState(64);
				pause();
				}
				break;
			case 12:
				_localctx = new Stat_ifContext(_localctx);
				enterOuterAlt(_localctx, 12);
				{
				setState(65);
				if_();
				}
				break;
			case 13:
				_localctx = new Stat_function_declarationContext(_localctx);
				enterOuterAlt(_localctx, 13);
				{
				setState(66);
				function_declaration();
				}
				break;
			case 14:
				_localctx = new Stat_functionContext(_localctx);
				enterOuterAlt(_localctx, 14);
				{
				setState(67);
				function();
				}
				break;
			case 15:
				_localctx = new Stat_canvas_selectContext(_localctx);
				enterOuterAlt(_localctx, 15);
				{
				setState(68);
				canvas_select();
				}
				break;
			case 16:
				_localctx = new Stat_UntilContext(_localctx);
				enterOuterAlt(_localctx, 16);
				{
				setState(69);
				until();
				}
				break;
			case 17:
				_localctx = new Stat_ForContext(_localctx);
				enterOuterAlt(_localctx, 17);
				{
				setState(70);
				for_loop();
				}
				break;
			case 18:
				_localctx = new Stat_ExprContext(_localctx);
				enterOuterAlt(_localctx, 18);
				{
				setState(71);
				expr(0);
				}
				break;
			case 19:
				_localctx = new Stat_CurlyContext(_localctx);
				enterOuterAlt(_localctx, 19);
				{
				setState(72);
				match(T__0);
				setState(76);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while ((((_la) & ~0x3f) == 0 && ((1L << _la) & 7475975512836145154L) != 0)) {
					{
					{
					setState(73);
					stat();
					}
					}
					setState(78);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(79);
				match(T__1);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PenAttributeContext extends ParserRuleContext {
		public PenAttributeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_penAttribute; }
	 
		public PenAttributeContext() { }
		public void copyFrom(PenAttributeContext ctx) {
			super.copyFrom(ctx);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenAttribute_colorContext extends PenAttributeContext {
		public TerminalNode Color() { return getToken(pdrawParser.Color, 0); }
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public PenAttribute_colorContext(PenAttributeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenAttribute_color(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenAttribute_color(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenAttribute_color(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenAttribute_orientationContext extends PenAttributeContext {
		public Token penRotateUnits;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public PenAttribute_orientationContext(PenAttributeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenAttribute_orientation(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenAttribute_orientation(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenAttribute_orientation(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenAttribute_positionContext extends PenAttributeContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public PenAttribute_positionContext(PenAttributeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenAttribute_position(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenAttribute_position(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenAttribute_position(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenAttribute_thicknessContext extends PenAttributeContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public PenAttribute_thicknessContext(PenAttributeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenAttribute_thickness(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenAttribute_thickness(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenAttribute_thickness(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenAttribute_pressureContext extends PenAttributeContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public PenAttribute_pressureContext(PenAttributeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenAttribute_pressure(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenAttribute_pressure(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenAttribute_pressure(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PenAttributeContext penAttribute() throws RecognitionException {
		PenAttributeContext _localctx = new PenAttributeContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_penAttribute);
		int _la;
		try {
			setState(119);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__2:
				_localctx = new PenAttribute_colorContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(82);
				match(T__2);
				setState(84);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(83);
					match(T__3);
					}
				}

				setState(86);
				match(Color);
				setState(87);
				match(Comma);
				}
				break;
			case T__4:
				_localctx = new PenAttribute_positionContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(88);
				match(T__4);
				setState(90);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(89);
					match(T__3);
					}
				}

				setState(92);
				expr(0);
				setState(93);
				match(Comma);
				}
				break;
			case T__5:
				_localctx = new PenAttribute_orientationContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(95);
				match(T__5);
				setState(97);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(96);
					match(T__3);
					}
				}

				setState(99);
				expr(0);
				setState(101);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__6 || _la==T__7) {
					{
					setState(100);
					((PenAttribute_orientationContext)_localctx).penRotateUnits = _input.LT(1);
					_la = _input.LA(1);
					if ( !(_la==T__6 || _la==T__7) ) {
						((PenAttribute_orientationContext)_localctx).penRotateUnits = (Token)_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
				}

				setState(103);
				match(Comma);
				}
				break;
			case T__8:
				_localctx = new PenAttribute_thicknessContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(105);
				match(T__8);
				setState(107);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(106);
					match(T__3);
					}
				}

				setState(109);
				expr(0);
				setState(110);
				match(Comma);
				}
				break;
			case T__9:
				_localctx = new PenAttribute_pressureContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(112);
				match(T__9);
				setState(114);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(113);
					match(T__3);
					}
				}

				setState(116);
				expr(0);
				setState(117);
				match(Comma);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PenOptionsContext extends ParserRuleContext {
		public PenOptionsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_penOptions; }
	 
		public PenOptionsContext() { }
		public void copyFrom(PenOptionsContext ctx) {
			super.copyFrom(ctx);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenOptions_backwardContext extends PenOptionsContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenOptions_backwardContext(PenOptionsContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenOptions_backward(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenOptions_backward(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenOptions_backward(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenOptions_rightContext extends PenOptionsContext {
		public Token penRotateUnits;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenOptions_rightContext(PenOptionsContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenOptions_right(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenOptions_right(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenOptions_right(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenOptions_downContext extends PenOptionsContext {
		public PenOptions_downContext(PenOptionsContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenOptions_down(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenOptions_down(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenOptions_down(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenOptions_pauseContext extends PenOptionsContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenOptions_pauseContext(PenOptionsContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenOptions_pause(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenOptions_pause(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenOptions_pause(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenOptions_upContext extends PenOptionsContext {
		public PenOptions_upContext(PenOptionsContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenOptions_up(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenOptions_up(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenOptions_up(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenOptions_forwardContext extends PenOptionsContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenOptions_forwardContext(PenOptionsContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenOptions_forward(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenOptions_forward(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenOptions_forward(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenOptions_leftContext extends PenOptionsContext {
		public Token penRotateUnits;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenOptions_leftContext(PenOptionsContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenOptions_left(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenOptions_left(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenOptions_left(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PenOptionsContext penOptions() throws RecognitionException {
		PenOptionsContext _localctx = new PenOptionsContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_penOptions);
		int _la;
		try {
			setState(139);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__10:
				_localctx = new PenOptions_forwardContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(121);
				match(T__10);
				setState(122);
				expr(0);
				}
				break;
			case T__11:
				_localctx = new PenOptions_backwardContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(123);
				match(T__11);
				setState(124);
				expr(0);
				}
				break;
			case T__12:
				_localctx = new PenOptions_upContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(125);
				match(T__12);
				}
				break;
			case T__13:
				_localctx = new PenOptions_downContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(126);
				match(T__13);
				}
				break;
			case T__14:
				_localctx = new PenOptions_leftContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(127);
				match(T__14);
				setState(128);
				expr(0);
				setState(130);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__6 || _la==T__7) {
					{
					setState(129);
					((PenOptions_leftContext)_localctx).penRotateUnits = _input.LT(1);
					_la = _input.LA(1);
					if ( !(_la==T__6 || _la==T__7) ) {
						((PenOptions_leftContext)_localctx).penRotateUnits = (Token)_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
				}

				}
				break;
			case T__15:
				_localctx = new PenOptions_rightContext(_localctx);
				enterOuterAlt(_localctx, 6);
				{
				setState(132);
				match(T__15);
				setState(133);
				expr(0);
				setState(135);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__6 || _la==T__7) {
					{
					setState(134);
					((PenOptions_rightContext)_localctx).penRotateUnits = _input.LT(1);
					_la = _input.LA(1);
					if ( !(_la==T__6 || _la==T__7) ) {
						((PenOptions_rightContext)_localctx).penRotateUnits = (Token)_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
				}

				}
				break;
			case T__16:
				_localctx = new PenOptions_pauseContext(_localctx);
				enterOuterAlt(_localctx, 7);
				{
				setState(137);
				match(T__16);
				setState(138);
				expr(0);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PenTypeDefContext extends ParserRuleContext {
		public TerminalNode Id() { return getToken(pdrawParser.Id, 0); }
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public List<PenAttributeContext> penAttribute() {
			return getRuleContexts(PenAttributeContext.class);
		}
		public PenAttributeContext penAttribute(int i) {
			return getRuleContext(PenAttributeContext.class,i);
		}
		public PenTypeDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_penTypeDef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenTypeDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenTypeDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenTypeDef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PenTypeDefContext penTypeDef() throws RecognitionException {
		PenTypeDefContext _localctx = new PenTypeDefContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_penTypeDef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(141);
			match(T__17);
			setState(142);
			match(T__18);
			setState(143);
			match(Id);
			setState(144);
			match(T__0);
			setState(146); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(145);
				penAttribute();
				}
				}
				setState(148); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & 1640L) != 0) );
			setState(150);
			match(T__1);
			setState(151);
			match(Comma);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PenActionContext extends ParserRuleContext {
		public TerminalNode Id() { return getToken(pdrawParser.Id, 0); }
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public List<PenOptionsContext> penOptions() {
			return getRuleContexts(PenOptionsContext.class);
		}
		public PenOptionsContext penOptions(int i) {
			return getRuleContext(PenOptionsContext.class,i);
		}
		public PenActionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_penAction; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenAction(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenAction(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenAction(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PenActionContext penAction() throws RecognitionException {
		PenActionContext _localctx = new PenActionContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_penAction);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(153);
			match(Id);
			setState(155); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(154);
				penOptions();
				}
				}
				setState(157); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & 260096L) != 0) );
			setState(159);
			match(Comma);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class CanvasDefContext extends ParserRuleContext {
		public TerminalNode Id() { return getToken(pdrawParser.Id, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public List<TerminalNode> String() { return getTokens(pdrawParser.String); }
		public TerminalNode String(int i) {
			return getToken(pdrawParser.String, i);
		}
		public CanvasDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_canvasDef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterCanvasDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitCanvasDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitCanvasDef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CanvasDefContext canvasDef() throws RecognitionException {
		CanvasDefContext _localctx = new CanvasDefContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_canvasDef);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(161);
			match(T__17);
			setState(162);
			match(T__19);
			setState(163);
			match(Id);
			setState(165); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					{
					setState(164);
					match(String);
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(167); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,15,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
			setState(169);
			expr(0);
			setState(170);
			match(Comma);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PenAssignmentContext extends ParserRuleContext {
		public List<TerminalNode> Id() { return getTokens(pdrawParser.Id); }
		public TerminalNode Id(int i) {
			return getToken(pdrawParser.Id, i);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public PenAssignmentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_penAssignment; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenAssignment(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenAssignment(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenAssignment(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PenAssignmentContext penAssignment() throws RecognitionException {
		PenAssignmentContext _localctx = new PenAssignmentContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_penAssignment);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(172);
			match(T__18);
			setState(173);
			match(Id);
			setState(174);
			match(T__3);
			setState(175);
			match(T__20);
			setState(177);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==Id) {
				{
				setState(176);
				match(Id);
				}
			}

			setState(179);
			match(Comma);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class VarAssignmentContext extends ParserRuleContext {
		public List<TerminalNode> Id() { return getTokens(pdrawParser.Id); }
		public TerminalNode Id(int i) {
			return getToken(pdrawParser.Id, i);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public TerminalNode Type() { return getToken(pdrawParser.Type, 0); }
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public VarAssignmentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_varAssignment; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterVarAssignment(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitVarAssignment(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitVarAssignment(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VarAssignmentContext varAssignment() throws RecognitionException {
		VarAssignmentContext _localctx = new VarAssignmentContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_varAssignment);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(182);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==Type) {
				{
				setState(181);
				match(Type);
				}
			}

			setState(184);
			match(Id);
			{
			setState(185);
			match(T__3);
			setState(186);
			expr(0);
			}
			setState(194);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__21) {
				{
				{
				setState(188);
				match(T__21);
				setState(189);
				match(Id);
				setState(190);
				match(T__3);
				setState(191);
				expr(0);
				}
				}
				setState(196);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(198);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,19,_ctx) ) {
			case 1:
				{
				setState(197);
				match(Comma);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class VarDeclarationContext extends ParserRuleContext {
		public TerminalNode Type() { return getToken(pdrawParser.Type, 0); }
		public List<TerminalNode> Id() { return getTokens(pdrawParser.Id); }
		public TerminalNode Id(int i) {
			return getToken(pdrawParser.Id, i);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public VarDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_varDeclaration; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterVarDeclaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitVarDeclaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitVarDeclaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VarDeclarationContext varDeclaration() throws RecognitionException {
		VarDeclarationContext _localctx = new VarDeclarationContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_varDeclaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(200);
			match(Type);
			setState(201);
			match(Id);
			setState(206);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__21) {
				{
				{
				setState(202);
				match(T__21);
				setState(203);
				match(Id);
				}
				}
				setState(208);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(209);
			match(Comma);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PrintContext extends ParserRuleContext {
		public Token id;
		public Token id_class;
		public Token s;
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public TerminalNode Id() { return getToken(pdrawParser.Id, 0); }
		public List<TerminalNode> String() { return getTokens(pdrawParser.String); }
		public TerminalNode String(int i) {
			return getToken(pdrawParser.String, i);
		}
		public PrintContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_print; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPrint(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPrint(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPrint(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PrintContext print() throws RecognitionException {
		PrintContext _localctx = new PrintContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_print);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(218);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,22,_ctx) ) {
			case 1:
				{
				setState(211);
				((PrintContext)_localctx).id = match(Id);
				}
				break;
			case 2:
				{
				setState(212);
				((PrintContext)_localctx).id_class = match(Id);
				}
				break;
			case 3:
				{
				setState(214); 
				_errHandler.sync(this);
				_la = _input.LA(1);
				do {
					{
					{
					setState(213);
					((PrintContext)_localctx).s = match(String);
					}
					}
					setState(216); 
					_errHandler.sync(this);
					_la = _input.LA(1);
				} while ( _la==String );
				}
				break;
			}
			setState(220);
			match(T__22);
			setState(221);
			match(T__23);
			setState(222);
			match(Comma);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PenAlterContext extends ParserRuleContext {
		public TerminalNode Id() { return getToken(pdrawParser.Id, 0); }
		public PenAttributeContext penAttribute() {
			return getRuleContext(PenAttributeContext.class,0);
		}
		public PenAlterContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_penAlter; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPenAlter(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPenAlter(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPenAlter(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PenAlterContext penAlter() throws RecognitionException {
		PenAlterContext _localctx = new PenAlterContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_penAlter);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(224);
			match(Id);
			setState(225);
			match(T__24);
			setState(226);
			penAttribute();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ExecutionContext extends ParserRuleContext {
		public List<TerminalNode> Id() { return getTokens(pdrawParser.Id); }
		public TerminalNode Id(int i) {
			return getToken(pdrawParser.Id, i);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public List<TerminalNode> String() { return getTokens(pdrawParser.String); }
		public TerminalNode String(int i) {
			return getToken(pdrawParser.String, i);
		}
		public ExecutionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_execution; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExecution(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExecution(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExecution(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExecutionContext execution() throws RecognitionException {
		ExecutionContext _localctx = new ExecutionContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_execution);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(228);
			match(Id);
			setState(233);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__21) {
				{
				{
				setState(229);
				match(T__21);
				setState(230);
				match(Id);
				}
				}
				setState(235);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(236);
			match(T__24);
			setState(237);
			match(T__25);
			setState(239); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(238);
				match(String);
				}
				}
				setState(241); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==String );
			setState(243);
			match(Comma);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PauseContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public PauseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_pause; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPause(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPause(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPause(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PauseContext pause() throws RecognitionException {
		PauseContext _localctx = new PauseContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_pause);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(245);
			match(T__16);
			setState(246);
			expr(0);
			setState(247);
			match(Comma);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class IfContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public StatContext stat() {
			return getRuleContext(StatContext.class,0);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public IfContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_if; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterIf(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitIf(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitIf(this);
			else return visitor.visitChildren(this);
		}
	}

	public final IfContext if_() throws RecognitionException {
		IfContext _localctx = new IfContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_if);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(249);
			match(T__26);
			setState(250);
			match(T__27);
			setState(251);
			expr(0);
			setState(252);
			match(T__28);
			setState(253);
			stat();
			setState(255);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,25,_ctx) ) {
			case 1:
				{
				setState(254);
				match(Comma);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class Canvas_selectContext extends ParserRuleContext {
		public List<TerminalNode> Id() { return getTokens(pdrawParser.Id); }
		public TerminalNode Id(int i) {
			return getToken(pdrawParser.Id, i);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public Canvas_selectContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_canvas_select; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterCanvas_select(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitCanvas_select(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitCanvas_select(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Canvas_selectContext canvas_select() throws RecognitionException {
		Canvas_selectContext _localctx = new Canvas_selectContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_canvas_select);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(257);
			match(T__18);
			setState(258);
			match(Id);
			setState(259);
			match(T__29);
			setState(260);
			match(T__19);
			setState(261);
			match(Id);
			setState(262);
			match(Comma);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class Canvas_colorContext extends ParserRuleContext {
		public TerminalNode Id() { return getToken(pdrawParser.Id, 0); }
		public TerminalNode Color() { return getToken(pdrawParser.Color, 0); }
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public Canvas_colorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_canvas_color; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterCanvas_color(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitCanvas_color(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitCanvas_color(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Canvas_colorContext canvas_color() throws RecognitionException {
		Canvas_colorContext _localctx = new Canvas_colorContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_canvas_color);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(264);
			match(T__19);
			setState(265);
			match(Id);
			setState(266);
			match(T__2);
			setState(267);
			match(T__24);
			setState(268);
			match(Color);
			setState(270);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,26,_ctx) ) {
			case 1:
				{
				setState(269);
				match(Comma);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class Function_declarationContext extends ParserRuleContext {
		public List<TerminalNode> Id() { return getTokens(pdrawParser.Id); }
		public TerminalNode Id(int i) {
			return getToken(pdrawParser.Id, i);
		}
		public StatContext stat() {
			return getRuleContext(StatContext.class,0);
		}
		public List<TerminalNode> Type() { return getTokens(pdrawParser.Type); }
		public TerminalNode Type(int i) {
			return getToken(pdrawParser.Type, i);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public Function_declarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_function_declaration; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterFunction_declaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitFunction_declaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitFunction_declaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Function_declarationContext function_declaration() throws RecognitionException {
		Function_declarationContext _localctx = new Function_declarationContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_function_declaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(272);
			match(T__30);
			setState(273);
			match(T__31);
			setState(274);
			match(Id);
			setState(275);
			match(T__27);
			setState(286);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==Type) {
				{
				setState(276);
				match(Type);
				setState(277);
				match(Id);
				setState(283);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__21) {
					{
					{
					setState(278);
					match(T__21);
					setState(279);
					match(Type);
					setState(280);
					match(Id);
					}
					}
					setState(285);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
			}

			setState(288);
			match(T__28);
			setState(289);
			stat();
			setState(291);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,29,_ctx) ) {
			case 1:
				{
				setState(290);
				match(Comma);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class FunctionContext extends ParserRuleContext {
		public TerminalNode Id() { return getToken(pdrawParser.Id, 0); }
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public FunctionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_function; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterFunction(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitFunction(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitFunction(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FunctionContext function() throws RecognitionException {
		FunctionContext _localctx = new FunctionContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_function);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(293);
			match(T__32);
			setState(294);
			match(Id);
			setState(295);
			match(T__27);
			setState(304);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & 7475975450422935552L) != 0)) {
				{
				setState(296);
				expr(0);
				setState(301);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__21) {
					{
					{
					setState(297);
					match(T__21);
					setState(298);
					expr(0);
					}
					}
					setState(303);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
			}

			setState(306);
			match(T__28);
			setState(308);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,32,_ctx) ) {
			case 1:
				{
				setState(307);
				match(Comma);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class UntilContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public StatContext stat() {
			return getRuleContext(StatContext.class,0);
		}
		public TerminalNode Comma() { return getToken(pdrawParser.Comma, 0); }
		public UntilContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_until; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterUntil(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitUntil(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitUntil(this);
			else return visitor.visitChildren(this);
		}
	}

	public final UntilContext until() throws RecognitionException {
		UntilContext _localctx = new UntilContext(_ctx, getState());
		enterRule(_localctx, 38, RULE_until);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(310);
			match(T__33);
			setState(311);
			match(T__27);
			setState(312);
			expr(0);
			setState(313);
			match(T__28);
			setState(314);
			stat();
			setState(316);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,33,_ctx) ) {
			case 1:
				{
				setState(315);
				match(Comma);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class For_loopContext extends ParserRuleContext {
		public List<VarAssignmentContext> varAssignment() {
			return getRuleContexts(VarAssignmentContext.class);
		}
		public VarAssignmentContext varAssignment(int i) {
			return getRuleContext(VarAssignmentContext.class,i);
		}
		public List<TerminalNode> Comma() { return getTokens(pdrawParser.Comma); }
		public TerminalNode Comma(int i) {
			return getToken(pdrawParser.Comma, i);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public StatContext stat() {
			return getRuleContext(StatContext.class,0);
		}
		public For_loopContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_for_loop; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterFor_loop(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitFor_loop(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitFor_loop(this);
			else return visitor.visitChildren(this);
		}
	}

	public final For_loopContext for_loop() throws RecognitionException {
		For_loopContext _localctx = new For_loopContext(_ctx, getState());
		enterRule(_localctx, 40, RULE_for_loop);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(318);
			match(T__34);
			setState(319);
			match(T__27);
			setState(320);
			varAssignment();
			setState(321);
			match(Comma);
			setState(322);
			expr(0);
			setState(323);
			match(Comma);
			setState(324);
			varAssignment();
			setState(325);
			match(T__28);
			setState(326);
			stat();
			setState(328);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,34,_ctx) ) {
			case 1:
				{
				setState(327);
				match(Comma);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ExprContext extends ParserRuleContext {
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
	 
		public ExprContext() { }
		public void copyFrom(ExprContext ctx) {
			super.copyFrom(ctx);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_stdinContext extends ExprContext {
		public List<TerminalNode> String() { return getTokens(pdrawParser.String); }
		public TerminalNode String(int i) {
			return getToken(pdrawParser.String, i);
		}
		public Expr_stdinContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_stdin(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_stdin(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_stdin(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_parenthesisContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Expr_parenthesisContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_parenthesis(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_parenthesis(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_parenthesis(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_bool_andContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Expr_bool_andContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_bool_and(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_bool_and(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_bool_and(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_bool_notContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Expr_bool_notContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_bool_not(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_bool_not(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_bool_not(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_multContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Expr_multContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_mult(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_mult(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_mult(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_varContext extends ExprContext {
		public TerminalNode Id() { return getToken(pdrawParser.Id, 0); }
		public Expr_varContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_var(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_var(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_var(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_boolContext extends ExprContext {
		public TerminalNode Bool() { return getToken(pdrawParser.Bool, 0); }
		public Expr_boolContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_bool(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_bool(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_bool(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_bool_comparisonContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Expr_bool_comparisonContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_bool_comparison(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_bool_comparison(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_bool_comparison(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_intContext extends ExprContext {
		public TerminalNode Int() { return getToken(pdrawParser.Int, 0); }
		public Expr_intContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_int(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_int(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_int(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_pointContext extends ExprContext {
		public PointContext point() {
			return getRuleContext(PointContext.class,0);
		}
		public Expr_pointContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_point(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_point(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_point(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_sumContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Expr_sumContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_sum(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_sum(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_sum(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_realContext extends ExprContext {
		public TerminalNode Real() { return getToken(pdrawParser.Real, 0); }
		public Expr_realContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_real(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_real(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_real(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_stringContext extends ExprContext {
		public List<TerminalNode> String() { return getTokens(pdrawParser.String); }
		public TerminalNode String(int i) {
			return getToken(pdrawParser.String, i);
		}
		public Expr_stringContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_string(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_string(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_string(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_bool_or_xorContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Expr_bool_or_xorContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_bool_or_xor(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_bool_or_xor(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_bool_or_xor(this);
			else return visitor.visitChildren(this);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_conversionContext extends ExprContext {
		public TerminalNode Type() { return getToken(pdrawParser.Type, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Expr_conversionContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterExpr_conversion(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitExpr_conversion(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitExpr_conversion(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 42;
		enterRecursionRule(_localctx, 42, RULE_expr, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(358);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,37,_ctx) ) {
			case 1:
				{
				_localctx = new Expr_conversionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(331);
				match(Type);
				setState(332);
				match(T__27);
				setState(333);
				expr(0);
				setState(334);
				match(T__28);
				}
				break;
			case 2:
				{
				_localctx = new Expr_parenthesisContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(336);
				match(T__27);
				setState(337);
				expr(0);
				setState(338);
				match(T__28);
				}
				break;
			case 3:
				{
				_localctx = new Expr_bool_notContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(340);
				match(T__35);
				setState(341);
				expr(13);
				}
				break;
			case 4:
				{
				_localctx = new Expr_stdinContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(342);
				match(T__53);
				setState(344); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(343);
						match(String);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(346); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,35,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				}
				break;
			case 5:
				{
				_localctx = new Expr_realContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(348);
				match(Real);
				}
				break;
			case 6:
				{
				_localctx = new Expr_intContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(349);
				match(Int);
				}
				break;
			case 7:
				{
				_localctx = new Expr_pointContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(350);
				point();
				}
				break;
			case 8:
				{
				_localctx = new Expr_varContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(351);
				match(Id);
				}
				break;
			case 9:
				{
				_localctx = new Expr_boolContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(352);
				match(Bool);
				}
				break;
			case 10:
				{
				_localctx = new Expr_stringContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(354); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(353);
						match(String);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(356); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,36,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(377);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,39,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(375);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,38,_ctx) ) {
					case 1:
						{
						_localctx = new Expr_bool_comparisonContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(360);
						if (!(precpred(_ctx, 12))) throw new FailedPredicateException(this, "precpred(_ctx, 12)");
						setState(361);
						((Expr_bool_comparisonContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & 8658654068736L) != 0)) ) {
							((Expr_bool_comparisonContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(362);
						expr(13);
						}
						break;
					case 2:
						{
						_localctx = new Expr_multContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(363);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(364);
						((Expr_multContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & 554153860399104L) != 0)) ) {
							((Expr_multContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(365);
						expr(12);
						}
						break;
					case 3:
						{
						_localctx = new Expr_sumContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(366);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(367);
						((Expr_sumContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__48 || _la==T__49) ) {
							((Expr_sumContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(368);
						expr(11);
						}
						break;
					case 4:
						{
						_localctx = new Expr_bool_andContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(369);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(370);
						match(T__50);
						setState(371);
						expr(10);
						}
						break;
					case 5:
						{
						_localctx = new Expr_bool_or_xorContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(372);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(373);
						((Expr_bool_or_xorContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__51 || _la==T__52) ) {
							((Expr_bool_or_xorContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(374);
						expr(9);
						}
						break;
					}
					} 
				}
				setState(379);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,39,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PointContext extends ParserRuleContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public PointContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_point; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).enterPoint(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof pdrawListener ) ((pdrawListener)listener).exitPoint(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof pdrawVisitor ) return ((pdrawVisitor<? extends T>)visitor).visitPoint(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PointContext point() throws RecognitionException {
		PointContext _localctx = new PointContext(_ctx, getState());
		enterRule(_localctx, 44, RULE_point);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(380);
			match(T__27);
			setState(381);
			expr(0);
			setState(382);
			match(T__21);
			setState(383);
			expr(0);
			setState(384);
			match(T__28);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 21:
			return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 12);
		case 1:
			return precpred(_ctx, 11);
		case 2:
			return precpred(_ctx, 10);
		case 3:
			return precpred(_ctx, 9);
		case 4:
			return precpred(_ctx, 8);
		}
		return true;
	}

	public static final String _serializedATN =
		"\u0004\u0001B\u0183\u0002\u0000\u0007\u0000\u0002\u0001\u0007\u0001\u0002"+
		"\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004\u0007\u0004\u0002"+
		"\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007\u0007\u0007\u0002"+
		"\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b\u0007\u000b\u0002"+
		"\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e\u0002\u000f\u0007\u000f"+
		"\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011\u0002\u0012\u0007\u0012"+
		"\u0002\u0013\u0007\u0013\u0002\u0014\u0007\u0014\u0002\u0015\u0007\u0015"+
		"\u0002\u0016\u0007\u0016\u0001\u0000\u0005\u00000\b\u0000\n\u0000\f\u0000"+
		"3\t\u0000\u0001\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0005\u0001"+
		"K\b\u0001\n\u0001\f\u0001N\t\u0001\u0001\u0001\u0003\u0001Q\b\u0001\u0001"+
		"\u0002\u0001\u0002\u0003\u0002U\b\u0002\u0001\u0002\u0001\u0002\u0001"+
		"\u0002\u0001\u0002\u0003\u0002[\b\u0002\u0001\u0002\u0001\u0002\u0001"+
		"\u0002\u0001\u0002\u0001\u0002\u0003\u0002b\b\u0002\u0001\u0002\u0001"+
		"\u0002\u0003\u0002f\b\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001"+
		"\u0002\u0003\u0002l\b\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001"+
		"\u0002\u0001\u0002\u0003\u0002s\b\u0002\u0001\u0002\u0001\u0002\u0001"+
		"\u0002\u0003\u0002x\b\u0002\u0001\u0003\u0001\u0003\u0001\u0003\u0001"+
		"\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0003"+
		"\u0003\u0083\b\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0003\u0003\u0088"+
		"\b\u0003\u0001\u0003\u0001\u0003\u0003\u0003\u008c\b\u0003\u0001\u0004"+
		"\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004\u0004\u0004\u0093\b\u0004"+
		"\u000b\u0004\f\u0004\u0094\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0005"+
		"\u0001\u0005\u0004\u0005\u009c\b\u0005\u000b\u0005\f\u0005\u009d\u0001"+
		"\u0005\u0001\u0005\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0006\u0004"+
		"\u0006\u00a6\b\u0006\u000b\u0006\f\u0006\u00a7\u0001\u0006\u0001\u0006"+
		"\u0001\u0006\u0001\u0007\u0001\u0007\u0001\u0007\u0001\u0007\u0001\u0007"+
		"\u0003\u0007\u00b2\b\u0007\u0001\u0007\u0001\u0007\u0001\b\u0003\b\u00b7"+
		"\b\b\u0001\b\u0001\b\u0001\b\u0001\b\u0001\b\u0001\b\u0001\b\u0001\b\u0005"+
		"\b\u00c1\b\b\n\b\f\b\u00c4\t\b\u0001\b\u0003\b\u00c7\b\b\u0001\t\u0001"+
		"\t\u0001\t\u0001\t\u0005\t\u00cd\b\t\n\t\f\t\u00d0\t\t\u0001\t\u0001\t"+
		"\u0001\n\u0001\n\u0001\n\u0004\n\u00d7\b\n\u000b\n\f\n\u00d8\u0003\n\u00db"+
		"\b\n\u0001\n\u0001\n\u0001\n\u0001\n\u0001\u000b\u0001\u000b\u0001\u000b"+
		"\u0001\u000b\u0001\f\u0001\f\u0001\f\u0005\f\u00e8\b\f\n\f\f\f\u00eb\t"+
		"\f\u0001\f\u0001\f\u0001\f\u0004\f\u00f0\b\f\u000b\f\f\f\u00f1\u0001\f"+
		"\u0001\f\u0001\r\u0001\r\u0001\r\u0001\r\u0001\u000e\u0001\u000e\u0001"+
		"\u000e\u0001\u000e\u0001\u000e\u0001\u000e\u0003\u000e\u0100\b\u000e\u0001"+
		"\u000f\u0001\u000f\u0001\u000f\u0001\u000f\u0001\u000f\u0001\u000f\u0001"+
		"\u000f\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0010\u0001"+
		"\u0010\u0003\u0010\u010f\b\u0010\u0001\u0011\u0001\u0011\u0001\u0011\u0001"+
		"\u0011\u0001\u0011\u0001\u0011\u0001\u0011\u0001\u0011\u0001\u0011\u0005"+
		"\u0011\u011a\b\u0011\n\u0011\f\u0011\u011d\t\u0011\u0003\u0011\u011f\b"+
		"\u0011\u0001\u0011\u0001\u0011\u0001\u0011\u0003\u0011\u0124\b\u0011\u0001"+
		"\u0012\u0001\u0012\u0001\u0012\u0001\u0012\u0001\u0012\u0001\u0012\u0005"+
		"\u0012\u012c\b\u0012\n\u0012\f\u0012\u012f\t\u0012\u0003\u0012\u0131\b"+
		"\u0012\u0001\u0012\u0001\u0012\u0003\u0012\u0135\b\u0012\u0001\u0013\u0001"+
		"\u0013\u0001\u0013\u0001\u0013\u0001\u0013\u0001\u0013\u0003\u0013\u013d"+
		"\b\u0013\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0001"+
		"\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0003\u0014\u0149"+
		"\b\u0014\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001"+
		"\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001"+
		"\u0015\u0001\u0015\u0001\u0015\u0004\u0015\u0159\b\u0015\u000b\u0015\f"+
		"\u0015\u015a\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015"+
		"\u0001\u0015\u0004\u0015\u0163\b\u0015\u000b\u0015\f\u0015\u0164\u0003"+
		"\u0015\u0167\b\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001"+
		"\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001"+
		"\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0005\u0015\u0178"+
		"\b\u0015\n\u0015\f\u0015\u017b\t\u0015\u0001\u0016\u0001\u0016\u0001\u0016"+
		"\u0001\u0016\u0001\u0016\u0001\u0016\u0001\u0016\u0000\u0001*\u0017\u0000"+
		"\u0002\u0004\u0006\b\n\f\u000e\u0010\u0012\u0014\u0016\u0018\u001a\u001c"+
		"\u001e \"$&(*,\u0000\u0005\u0001\u0000\u0007\b\u0001\u0000%*\u0001\u0000"+
		"+0\u0001\u000012\u0001\u000045\u01b8\u00001\u0001\u0000\u0000\u0000\u0002"+
		"P\u0001\u0000\u0000\u0000\u0004w\u0001\u0000\u0000\u0000\u0006\u008b\u0001"+
		"\u0000\u0000\u0000\b\u008d\u0001\u0000\u0000\u0000\n\u0099\u0001\u0000"+
		"\u0000\u0000\f\u00a1\u0001\u0000\u0000\u0000\u000e\u00ac\u0001\u0000\u0000"+
		"\u0000\u0010\u00b6\u0001\u0000\u0000\u0000\u0012\u00c8\u0001\u0000\u0000"+
		"\u0000\u0014\u00da\u0001\u0000\u0000\u0000\u0016\u00e0\u0001\u0000\u0000"+
		"\u0000\u0018\u00e4\u0001\u0000\u0000\u0000\u001a\u00f5\u0001\u0000\u0000"+
		"\u0000\u001c\u00f9\u0001\u0000\u0000\u0000\u001e\u0101\u0001\u0000\u0000"+
		"\u0000 \u0108\u0001\u0000\u0000\u0000\"\u0110\u0001\u0000\u0000\u0000"+
		"$\u0125\u0001\u0000\u0000\u0000&\u0136\u0001\u0000\u0000\u0000(\u013e"+
		"\u0001\u0000\u0000\u0000*\u0166\u0001\u0000\u0000\u0000,\u017c\u0001\u0000"+
		"\u0000\u0000.0\u0003\u0002\u0001\u0000/.\u0001\u0000\u0000\u000003\u0001"+
		"\u0000\u0000\u00001/\u0001\u0000\u0000\u000012\u0001\u0000\u0000\u0000"+
		"24\u0001\u0000\u0000\u000031\u0001\u0000\u0000\u000045\u0005\u0000\u0000"+
		"\u00015\u0001\u0001\u0000\u0000\u00006Q\u0003\b\u0004\u00007Q\u0003\u000e"+
		"\u0007\u00008Q\u0003\n\u0005\u00009Q\u0003\u0010\b\u0000:Q\u0003\u0012"+
		"\t\u0000;Q\u0003\u0018\f\u0000<Q\u0003\f\u0006\u0000=Q\u0003\u0014\n\u0000"+
		">Q\u0003 \u0010\u0000?Q\u0003\u0016\u000b\u0000@Q\u0003\u001a\r\u0000"+
		"AQ\u0003\u001c\u000e\u0000BQ\u0003\"\u0011\u0000CQ\u0003$\u0012\u0000"+
		"DQ\u0003\u001e\u000f\u0000EQ\u0003&\u0013\u0000FQ\u0003(\u0014\u0000G"+
		"Q\u0003*\u0015\u0000HL\u0005\u0001\u0000\u0000IK\u0003\u0002\u0001\u0000"+
		"JI\u0001\u0000\u0000\u0000KN\u0001\u0000\u0000\u0000LJ\u0001\u0000\u0000"+
		"\u0000LM\u0001\u0000\u0000\u0000MO\u0001\u0000\u0000\u0000NL\u0001\u0000"+
		"\u0000\u0000OQ\u0005\u0002\u0000\u0000P6\u0001\u0000\u0000\u0000P7\u0001"+
		"\u0000\u0000\u0000P8\u0001\u0000\u0000\u0000P9\u0001\u0000\u0000\u0000"+
		"P:\u0001\u0000\u0000\u0000P;\u0001\u0000\u0000\u0000P<\u0001\u0000\u0000"+
		"\u0000P=\u0001\u0000\u0000\u0000P>\u0001\u0000\u0000\u0000P?\u0001\u0000"+
		"\u0000\u0000P@\u0001\u0000\u0000\u0000PA\u0001\u0000\u0000\u0000PB\u0001"+
		"\u0000\u0000\u0000PC\u0001\u0000\u0000\u0000PD\u0001\u0000\u0000\u0000"+
		"PE\u0001\u0000\u0000\u0000PF\u0001\u0000\u0000\u0000PG\u0001\u0000\u0000"+
		"\u0000PH\u0001\u0000\u0000\u0000Q\u0003\u0001\u0000\u0000\u0000RT\u0005"+
		"\u0003\u0000\u0000SU\u0005\u0004\u0000\u0000TS\u0001\u0000\u0000\u0000"+
		"TU\u0001\u0000\u0000\u0000UV\u0001\u0000\u0000\u0000VW\u0005;\u0000\u0000"+
		"Wx\u0005?\u0000\u0000XZ\u0005\u0005\u0000\u0000Y[\u0005\u0004\u0000\u0000"+
		"ZY\u0001\u0000\u0000\u0000Z[\u0001\u0000\u0000\u0000[\\\u0001\u0000\u0000"+
		"\u0000\\]\u0003*\u0015\u0000]^\u0005?\u0000\u0000^x\u0001\u0000\u0000"+
		"\u0000_a\u0005\u0006\u0000\u0000`b\u0005\u0004\u0000\u0000a`\u0001\u0000"+
		"\u0000\u0000ab\u0001\u0000\u0000\u0000bc\u0001\u0000\u0000\u0000ce\u0003"+
		"*\u0015\u0000df\u0007\u0000\u0000\u0000ed\u0001\u0000\u0000\u0000ef\u0001"+
		"\u0000\u0000\u0000fg\u0001\u0000\u0000\u0000gh\u0005?\u0000\u0000hx\u0001"+
		"\u0000\u0000\u0000ik\u0005\t\u0000\u0000jl\u0005\u0004\u0000\u0000kj\u0001"+
		"\u0000\u0000\u0000kl\u0001\u0000\u0000\u0000lm\u0001\u0000\u0000\u0000"+
		"mn\u0003*\u0015\u0000no\u0005?\u0000\u0000ox\u0001\u0000\u0000\u0000p"+
		"r\u0005\n\u0000\u0000qs\u0005\u0004\u0000\u0000rq\u0001\u0000\u0000\u0000"+
		"rs\u0001\u0000\u0000\u0000st\u0001\u0000\u0000\u0000tu\u0003*\u0015\u0000"+
		"uv\u0005?\u0000\u0000vx\u0001\u0000\u0000\u0000wR\u0001\u0000\u0000\u0000"+
		"wX\u0001\u0000\u0000\u0000w_\u0001\u0000\u0000\u0000wi\u0001\u0000\u0000"+
		"\u0000wp\u0001\u0000\u0000\u0000x\u0005\u0001\u0000\u0000\u0000yz\u0005"+
		"\u000b\u0000\u0000z\u008c\u0003*\u0015\u0000{|\u0005\f\u0000\u0000|\u008c"+
		"\u0003*\u0015\u0000}\u008c\u0005\r\u0000\u0000~\u008c\u0005\u000e\u0000"+
		"\u0000\u007f\u0080\u0005\u000f\u0000\u0000\u0080\u0082\u0003*\u0015\u0000"+
		"\u0081\u0083\u0007\u0000\u0000\u0000\u0082\u0081\u0001\u0000\u0000\u0000"+
		"\u0082\u0083\u0001\u0000\u0000\u0000\u0083\u008c\u0001\u0000\u0000\u0000"+
		"\u0084\u0085\u0005\u0010\u0000\u0000\u0085\u0087\u0003*\u0015\u0000\u0086"+
		"\u0088\u0007\u0000\u0000\u0000\u0087\u0086\u0001\u0000\u0000\u0000\u0087"+
		"\u0088\u0001\u0000\u0000\u0000\u0088\u008c\u0001\u0000\u0000\u0000\u0089"+
		"\u008a\u0005\u0011\u0000\u0000\u008a\u008c\u0003*\u0015\u0000\u008by\u0001"+
		"\u0000\u0000\u0000\u008b{\u0001\u0000\u0000\u0000\u008b}\u0001\u0000\u0000"+
		"\u0000\u008b~\u0001\u0000\u0000\u0000\u008b\u007f\u0001\u0000\u0000\u0000"+
		"\u008b\u0084\u0001\u0000\u0000\u0000\u008b\u0089\u0001\u0000\u0000\u0000"+
		"\u008c\u0007\u0001\u0000\u0000\u0000\u008d\u008e\u0005\u0012\u0000\u0000"+
		"\u008e\u008f\u0005\u0013\u0000\u0000\u008f\u0090\u0005=\u0000\u0000\u0090"+
		"\u0092\u0005\u0001\u0000\u0000\u0091\u0093\u0003\u0004\u0002\u0000\u0092"+
		"\u0091\u0001\u0000\u0000\u0000\u0093\u0094\u0001\u0000\u0000\u0000\u0094"+
		"\u0092\u0001\u0000\u0000\u0000\u0094\u0095\u0001\u0000\u0000\u0000\u0095"+
		"\u0096\u0001\u0000\u0000\u0000\u0096\u0097\u0005\u0002\u0000\u0000\u0097"+
		"\u0098\u0005?\u0000\u0000\u0098\t\u0001\u0000\u0000\u0000\u0099\u009b"+
		"\u0005=\u0000\u0000\u009a\u009c\u0003\u0006\u0003\u0000\u009b\u009a\u0001"+
		"\u0000\u0000\u0000\u009c\u009d\u0001\u0000\u0000\u0000\u009d\u009b\u0001"+
		"\u0000\u0000\u0000\u009d\u009e\u0001\u0000\u0000\u0000\u009e\u009f\u0001"+
		"\u0000\u0000\u0000\u009f\u00a0\u0005?\u0000\u0000\u00a0\u000b\u0001\u0000"+
		"\u0000\u0000\u00a1\u00a2\u0005\u0012\u0000\u0000\u00a2\u00a3\u0005\u0014"+
		"\u0000\u0000\u00a3\u00a5\u0005=\u0000\u0000\u00a4\u00a6\u0005>\u0000\u0000"+
		"\u00a5\u00a4\u0001\u0000\u0000\u0000\u00a6\u00a7\u0001\u0000\u0000\u0000"+
		"\u00a7\u00a5\u0001\u0000\u0000\u0000\u00a7\u00a8\u0001\u0000\u0000\u0000"+
		"\u00a8\u00a9\u0001\u0000\u0000\u0000\u00a9\u00aa\u0003*\u0015\u0000\u00aa"+
		"\u00ab\u0005?\u0000\u0000\u00ab\r\u0001\u0000\u0000\u0000\u00ac\u00ad"+
		"\u0005\u0013\u0000\u0000\u00ad\u00ae\u0005=\u0000\u0000\u00ae\u00af\u0005"+
		"\u0004\u0000\u0000\u00af\u00b1\u0005\u0015\u0000\u0000\u00b0\u00b2\u0005"+
		"=\u0000\u0000\u00b1\u00b0\u0001\u0000\u0000\u0000\u00b1\u00b2\u0001\u0000"+
		"\u0000\u0000\u00b2\u00b3\u0001\u0000\u0000\u0000\u00b3\u00b4\u0005?\u0000"+
		"\u0000\u00b4\u000f\u0001\u0000\u0000\u0000\u00b5\u00b7\u00057\u0000\u0000"+
		"\u00b6\u00b5\u0001\u0000\u0000\u0000\u00b6\u00b7\u0001\u0000\u0000\u0000"+
		"\u00b7\u00b8\u0001\u0000\u0000\u0000\u00b8\u00b9\u0005=\u0000\u0000\u00b9"+
		"\u00ba\u0005\u0004\u0000\u0000\u00ba\u00bb\u0003*\u0015\u0000\u00bb\u00c2"+
		"\u0001\u0000\u0000\u0000\u00bc\u00bd\u0005\u0016\u0000\u0000\u00bd\u00be"+
		"\u0005=\u0000\u0000\u00be\u00bf\u0005\u0004\u0000\u0000\u00bf\u00c1\u0003"+
		"*\u0015\u0000\u00c0\u00bc\u0001\u0000\u0000\u0000\u00c1\u00c4\u0001\u0000"+
		"\u0000\u0000\u00c2\u00c0\u0001\u0000\u0000\u0000\u00c2\u00c3\u0001\u0000"+
		"\u0000\u0000\u00c3\u00c6\u0001\u0000\u0000\u0000\u00c4\u00c2\u0001\u0000"+
		"\u0000\u0000\u00c5\u00c7\u0005?\u0000\u0000\u00c6\u00c5\u0001\u0000\u0000"+
		"\u0000\u00c6\u00c7\u0001\u0000\u0000\u0000\u00c7\u0011\u0001\u0000\u0000"+
		"\u0000\u00c8\u00c9\u00057\u0000\u0000\u00c9\u00ce\u0005=\u0000\u0000\u00ca"+
		"\u00cb\u0005\u0016\u0000\u0000\u00cb\u00cd\u0005=\u0000\u0000\u00cc\u00ca"+
		"\u0001\u0000\u0000\u0000\u00cd\u00d0\u0001\u0000\u0000\u0000\u00ce\u00cc"+
		"\u0001\u0000\u0000\u0000\u00ce\u00cf\u0001\u0000\u0000\u0000\u00cf\u00d1"+
		"\u0001\u0000\u0000\u0000\u00d0\u00ce\u0001\u0000\u0000\u0000\u00d1\u00d2"+
		"\u0005?\u0000\u0000\u00d2\u0013\u0001\u0000\u0000\u0000\u00d3\u00db\u0005"+
		"=\u0000\u0000\u00d4\u00db\u0005=\u0000\u0000\u00d5\u00d7\u0005>\u0000"+
		"\u0000\u00d6\u00d5\u0001\u0000\u0000\u0000\u00d7\u00d8\u0001\u0000\u0000"+
		"\u0000\u00d8\u00d6\u0001\u0000\u0000\u0000\u00d8\u00d9\u0001\u0000\u0000"+
		"\u0000\u00d9\u00db\u0001\u0000\u0000\u0000\u00da\u00d3\u0001\u0000\u0000"+
		"\u0000\u00da\u00d4\u0001\u0000\u0000\u0000\u00da\u00d6\u0001\u0000\u0000"+
		"\u0000\u00db\u00dc\u0001\u0000\u0000\u0000\u00dc\u00dd\u0005\u0017\u0000"+
		"\u0000\u00dd\u00de\u0005\u0018\u0000\u0000\u00de\u00df\u0005?\u0000\u0000"+
		"\u00df\u0015\u0001\u0000\u0000\u0000\u00e0\u00e1\u0005=\u0000\u0000\u00e1"+
		"\u00e2\u0005\u0019\u0000\u0000\u00e2\u00e3\u0003\u0004\u0002\u0000\u00e3"+
		"\u0017\u0001\u0000\u0000\u0000\u00e4\u00e9\u0005=\u0000\u0000\u00e5\u00e6"+
		"\u0005\u0016\u0000\u0000\u00e6\u00e8\u0005=\u0000\u0000\u00e7\u00e5\u0001"+
		"\u0000\u0000\u0000\u00e8\u00eb\u0001\u0000\u0000\u0000\u00e9\u00e7\u0001"+
		"\u0000\u0000\u0000\u00e9\u00ea\u0001\u0000\u0000\u0000\u00ea\u00ec\u0001"+
		"\u0000\u0000\u0000\u00eb\u00e9\u0001\u0000\u0000\u0000\u00ec\u00ed\u0005"+
		"\u0019\u0000\u0000\u00ed\u00ef\u0005\u001a\u0000\u0000\u00ee\u00f0\u0005"+
		">\u0000\u0000\u00ef\u00ee\u0001\u0000\u0000\u0000\u00f0\u00f1\u0001\u0000"+
		"\u0000\u0000\u00f1\u00ef\u0001\u0000\u0000\u0000\u00f1\u00f2\u0001\u0000"+
		"\u0000\u0000\u00f2\u00f3\u0001\u0000\u0000\u0000\u00f3\u00f4\u0005?\u0000"+
		"\u0000\u00f4\u0019\u0001\u0000\u0000\u0000\u00f5\u00f6\u0005\u0011\u0000"+
		"\u0000\u00f6\u00f7\u0003*\u0015\u0000\u00f7\u00f8\u0005?\u0000\u0000\u00f8"+
		"\u001b\u0001\u0000\u0000\u0000\u00f9\u00fa\u0005\u001b\u0000\u0000\u00fa"+
		"\u00fb\u0005\u001c\u0000\u0000\u00fb\u00fc\u0003*\u0015\u0000\u00fc\u00fd"+
		"\u0005\u001d\u0000\u0000\u00fd\u00ff\u0003\u0002\u0001\u0000\u00fe\u0100"+
		"\u0005?\u0000\u0000\u00ff\u00fe\u0001\u0000\u0000\u0000\u00ff\u0100\u0001"+
		"\u0000\u0000\u0000\u0100\u001d\u0001\u0000\u0000\u0000\u0101\u0102\u0005"+
		"\u0013\u0000\u0000\u0102\u0103\u0005=\u0000\u0000\u0103\u0104\u0005\u001e"+
		"\u0000\u0000\u0104\u0105\u0005\u0014\u0000\u0000\u0105\u0106\u0005=\u0000"+
		"\u0000\u0106\u0107\u0005?\u0000\u0000\u0107\u001f\u0001\u0000\u0000\u0000"+
		"\u0108\u0109\u0005\u0014\u0000\u0000\u0109\u010a\u0005=\u0000\u0000\u010a"+
		"\u010b\u0005\u0003\u0000\u0000\u010b\u010c\u0005\u0019\u0000\u0000\u010c"+
		"\u010e\u0005;\u0000\u0000\u010d\u010f\u0005?\u0000\u0000\u010e\u010d\u0001"+
		"\u0000\u0000\u0000\u010e\u010f\u0001\u0000\u0000\u0000\u010f!\u0001\u0000"+
		"\u0000\u0000\u0110\u0111\u0005\u001f\u0000\u0000\u0111\u0112\u0005 \u0000"+
		"\u0000\u0112\u0113\u0005=\u0000\u0000\u0113\u011e\u0005\u001c\u0000\u0000"+
		"\u0114\u0115\u00057\u0000\u0000\u0115\u011b\u0005=\u0000\u0000\u0116\u0117"+
		"\u0005\u0016\u0000\u0000\u0117\u0118\u00057\u0000\u0000\u0118\u011a\u0005"+
		"=\u0000\u0000\u0119\u0116\u0001\u0000\u0000\u0000\u011a\u011d\u0001\u0000"+
		"\u0000\u0000\u011b\u0119\u0001\u0000\u0000\u0000\u011b\u011c\u0001\u0000"+
		"\u0000\u0000\u011c\u011f\u0001\u0000\u0000\u0000\u011d\u011b\u0001\u0000"+
		"\u0000\u0000\u011e\u0114\u0001\u0000\u0000\u0000\u011e\u011f\u0001\u0000"+
		"\u0000\u0000\u011f\u0120\u0001\u0000\u0000\u0000\u0120\u0121\u0005\u001d"+
		"\u0000\u0000\u0121\u0123\u0003\u0002\u0001\u0000\u0122\u0124\u0005?\u0000"+
		"\u0000\u0123\u0122\u0001\u0000\u0000\u0000\u0123\u0124\u0001\u0000\u0000"+
		"\u0000\u0124#\u0001\u0000\u0000\u0000\u0125\u0126\u0005!\u0000\u0000\u0126"+
		"\u0127\u0005=\u0000\u0000\u0127\u0130\u0005\u001c\u0000\u0000\u0128\u012d"+
		"\u0003*\u0015\u0000\u0129\u012a\u0005\u0016\u0000\u0000\u012a\u012c\u0003"+
		"*\u0015\u0000\u012b\u0129\u0001\u0000\u0000\u0000\u012c\u012f\u0001\u0000"+
		"\u0000\u0000\u012d\u012b\u0001\u0000\u0000\u0000\u012d\u012e\u0001\u0000"+
		"\u0000\u0000\u012e\u0131\u0001\u0000\u0000\u0000\u012f\u012d\u0001\u0000"+
		"\u0000\u0000\u0130\u0128\u0001\u0000\u0000\u0000\u0130\u0131\u0001\u0000"+
		"\u0000\u0000\u0131\u0132\u0001\u0000\u0000\u0000\u0132\u0134\u0005\u001d"+
		"\u0000\u0000\u0133\u0135\u0005?\u0000\u0000\u0134\u0133\u0001\u0000\u0000"+
		"\u0000\u0134\u0135\u0001\u0000\u0000\u0000\u0135%\u0001\u0000\u0000\u0000"+
		"\u0136\u0137\u0005\"\u0000\u0000\u0137\u0138\u0005\u001c\u0000\u0000\u0138"+
		"\u0139\u0003*\u0015\u0000\u0139\u013a\u0005\u001d\u0000\u0000\u013a\u013c"+
		"\u0003\u0002\u0001\u0000\u013b\u013d\u0005?\u0000\u0000\u013c\u013b\u0001"+
		"\u0000\u0000\u0000\u013c\u013d\u0001\u0000\u0000\u0000\u013d\'\u0001\u0000"+
		"\u0000\u0000\u013e\u013f\u0005#\u0000\u0000\u013f\u0140\u0005\u001c\u0000"+
		"\u0000\u0140\u0141\u0003\u0010\b\u0000\u0141\u0142\u0005?\u0000\u0000"+
		"\u0142\u0143\u0003*\u0015\u0000\u0143\u0144\u0005?\u0000\u0000\u0144\u0145"+
		"\u0003\u0010\b\u0000\u0145\u0146\u0005\u001d\u0000\u0000\u0146\u0148\u0003"+
		"\u0002\u0001\u0000\u0147\u0149\u0005?\u0000\u0000\u0148\u0147\u0001\u0000"+
		"\u0000\u0000\u0148\u0149\u0001\u0000\u0000\u0000\u0149)\u0001\u0000\u0000"+
		"\u0000\u014a\u014b\u0006\u0015\uffff\uffff\u0000\u014b\u014c\u00057\u0000"+
		"\u0000\u014c\u014d\u0005\u001c\u0000\u0000\u014d\u014e\u0003*\u0015\u0000"+
		"\u014e\u014f\u0005\u001d\u0000\u0000\u014f\u0167\u0001\u0000\u0000\u0000"+
		"\u0150\u0151\u0005\u001c\u0000\u0000\u0151\u0152\u0003*\u0015\u0000\u0152"+
		"\u0153\u0005\u001d\u0000\u0000\u0153\u0167\u0001\u0000\u0000\u0000\u0154"+
		"\u0155\u0005$\u0000\u0000\u0155\u0167\u0003*\u0015\r\u0156\u0158\u0005"+
		"6\u0000\u0000\u0157\u0159\u0005>\u0000\u0000\u0158\u0157\u0001\u0000\u0000"+
		"\u0000\u0159\u015a\u0001\u0000\u0000\u0000\u015a\u0158\u0001\u0000\u0000"+
		"\u0000\u015a\u015b\u0001\u0000\u0000\u0000\u015b\u0167\u0001\u0000\u0000"+
		"\u0000\u015c\u0167\u00059\u0000\u0000\u015d\u0167\u00058\u0000\u0000\u015e"+
		"\u0167\u0003,\u0016\u0000\u015f\u0167\u0005=\u0000\u0000\u0160\u0167\u0005"+
		":\u0000\u0000\u0161\u0163\u0005>\u0000\u0000\u0162\u0161\u0001\u0000\u0000"+
		"\u0000\u0163\u0164\u0001\u0000\u0000\u0000\u0164\u0162\u0001\u0000\u0000"+
		"\u0000\u0164\u0165\u0001\u0000\u0000\u0000\u0165\u0167\u0001\u0000\u0000"+
		"\u0000\u0166\u014a\u0001\u0000\u0000\u0000\u0166\u0150\u0001\u0000\u0000"+
		"\u0000\u0166\u0154\u0001\u0000\u0000\u0000\u0166\u0156\u0001\u0000\u0000"+
		"\u0000\u0166\u015c\u0001\u0000\u0000\u0000\u0166\u015d\u0001\u0000\u0000"+
		"\u0000\u0166\u015e\u0001\u0000\u0000\u0000\u0166\u015f\u0001\u0000\u0000"+
		"\u0000\u0166\u0160\u0001\u0000\u0000\u0000\u0166\u0162\u0001\u0000\u0000"+
		"\u0000\u0167\u0179\u0001\u0000\u0000\u0000\u0168\u0169\n\f\u0000\u0000"+
		"\u0169\u016a\u0007\u0001\u0000\u0000\u016a\u0178\u0003*\u0015\r\u016b"+
		"\u016c\n\u000b\u0000\u0000\u016c\u016d\u0007\u0002\u0000\u0000\u016d\u0178"+
		"\u0003*\u0015\f\u016e\u016f\n\n\u0000\u0000\u016f\u0170\u0007\u0003\u0000"+
		"\u0000\u0170\u0178\u0003*\u0015\u000b\u0171\u0172\n\t\u0000\u0000\u0172"+
		"\u0173\u00053\u0000\u0000\u0173\u0178\u0003*\u0015\n\u0174\u0175\n\b\u0000"+
		"\u0000\u0175\u0176\u0007\u0004\u0000\u0000\u0176\u0178\u0003*\u0015\t"+
		"\u0177\u0168\u0001\u0000\u0000\u0000\u0177\u016b\u0001\u0000\u0000\u0000"+
		"\u0177\u016e\u0001\u0000\u0000\u0000\u0177\u0171\u0001\u0000\u0000\u0000"+
		"\u0177\u0174\u0001\u0000\u0000\u0000\u0178\u017b\u0001\u0000\u0000\u0000"+
		"\u0179\u0177\u0001\u0000\u0000\u0000\u0179\u017a\u0001\u0000\u0000\u0000"+
		"\u017a+\u0001\u0000\u0000\u0000\u017b\u0179\u0001\u0000\u0000\u0000\u017c"+
		"\u017d\u0005\u001c\u0000\u0000\u017d\u017e\u0003*\u0015\u0000\u017e\u017f"+
		"\u0005\u0016\u0000\u0000\u017f\u0180\u0003*\u0015\u0000\u0180\u0181\u0005"+
		"\u001d\u0000\u0000\u0181-\u0001\u0000\u0000\u0000(1LPTZaekrw\u0082\u0087"+
		"\u008b\u0094\u009d\u00a7\u00b1\u00b6\u00c2\u00c6\u00ce\u00d8\u00da\u00e9"+
		"\u00f1\u00ff\u010e\u011b\u011e\u0123\u012d\u0130\u0134\u013c\u0148\u015a"+
		"\u0164\u0166\u0177\u0179";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}