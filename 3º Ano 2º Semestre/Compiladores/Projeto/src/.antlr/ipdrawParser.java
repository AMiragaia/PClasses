// Generated from c:/Users/joaoa/OneDrive/Ambiente de Trabalho/Compiladores Projeto/pdraw-t06/src/ipdraw.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue"})
public class ipdrawParser extends Parser {
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
		T__45=46, T__46=47, Color=48, TYPE=49, ID=50, INT=51, REAL=52, BOOL=53, 
		STRING=54, RGBHex=55, Comment=56, WS=57;
	public static final int
		RULE_program = 0, RULE_stat = 1, RULE_penCommand = 2, RULE_varAssignment = 3, 
		RULE_varDeclaration = 4, RULE_expr = 5, RULE_if = 6, RULE_until = 7, RULE_print = 8, 
		RULE_pause = 9, RULE_interactador = 10, RULE_point = 11;
	private static String[] makeRuleNames() {
		return new String[] {
			"program", "stat", "penCommand", "varAssignment", "varDeclaration", "expr", 
			"if", "until", "print", "pause", "interactador", "point"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'{'", "'}'", "'position'", "'='", "';'", "'color'", "'orientation'", 
			"'\\u00BA'", "'rad'", "'thickness'", "'pressure'", "'down'", "'up'", 
			"'forward'", "'backward'", "'left'", "'right'", "'pause'", "','", "'('", 
			"')'", "'not'", "'!'", "'and'", "'&&'", "'or'", "'||'", "'xor'", "'=='", 
			"'!='", "'<='", "'<'", "'>='", "'>'", "'*'", "'/'", "'//'", "'%'", "'\\'", 
			"'**'", "'+'", "'-'", "'if'", "'until'", "'->'", "'stdout'", "'interactador'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			"Color", "TYPE", "ID", "INT", "REAL", "BOOL", "STRING", "RGBHex", "Comment", 
			"WS"
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
	public String getGrammarFileName() { return "ipdraw.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public ipdrawParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(ipdrawParser.EOF, 0); }
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
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(27);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & 19870374137691338L) != 0)) {
				{
				{
				setState(24);
				stat();
				}
				}
				setState(29);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(30);
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
	public static class Stat_varAssignmentContext extends StatContext {
		public VarAssignmentContext varAssignment() {
			return getRuleContext(VarAssignmentContext.class,0);
		}
		public Stat_varAssignmentContext(StatContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_UntilContext extends StatContext {
		public UntilContext until() {
			return getRuleContext(UntilContext.class,0);
		}
		public Stat_UntilContext(StatContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_pauseContext extends StatContext {
		public PauseContext pause() {
			return getRuleContext(PauseContext.class,0);
		}
		public Stat_pauseContext(StatContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_ifContext extends StatContext {
		public IfContext if_() {
			return getRuleContext(IfContext.class,0);
		}
		public Stat_ifContext(StatContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_printContext extends StatContext {
		public PrintContext print() {
			return getRuleContext(PrintContext.class,0);
		}
		public Stat_printContext(StatContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_interactadorContext extends StatContext {
		public InteractadorContext interactador() {
			return getRuleContext(InteractadorContext.class,0);
		}
		public Stat_interactadorContext(StatContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_penCmdContext extends StatContext {
		public PenCommandContext penCommand() {
			return getRuleContext(PenCommandContext.class,0);
		}
		public Stat_penCmdContext(StatContext ctx) { copyFrom(ctx); }
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
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Stat_varDeclarationContext extends StatContext {
		public VarDeclarationContext varDeclaration() {
			return getRuleContext(VarDeclarationContext.class,0);
		}
		public Stat_varDeclarationContext(StatContext ctx) { copyFrom(ctx); }
	}

	public final StatContext stat() throws RecognitionException {
		StatContext _localctx = new StatContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_stat);
		int _la;
		try {
			setState(48);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,2,_ctx) ) {
			case 1:
				_localctx = new Stat_penCmdContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(32);
				penCommand();
				}
				break;
			case 2:
				_localctx = new Stat_ifContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(33);
				if_();
				}
				break;
			case 3:
				_localctx = new Stat_UntilContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(34);
				until();
				}
				break;
			case 4:
				_localctx = new Stat_printContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(35);
				print();
				}
				break;
			case 5:
				_localctx = new Stat_CurlyContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(36);
				match(T__0);
				setState(40);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while ((((_la) & ~0x3f) == 0 && ((1L << _la) & 19870374137691338L) != 0)) {
					{
					{
					setState(37);
					stat();
					}
					}
					setState(42);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(43);
				match(T__1);
				}
				break;
			case 6:
				_localctx = new Stat_varAssignmentContext(_localctx);
				enterOuterAlt(_localctx, 6);
				{
				setState(44);
				varAssignment();
				}
				break;
			case 7:
				_localctx = new Stat_varDeclarationContext(_localctx);
				enterOuterAlt(_localctx, 7);
				{
				setState(45);
				varDeclaration();
				}
				break;
			case 8:
				_localctx = new Stat_pauseContext(_localctx);
				enterOuterAlt(_localctx, 8);
				{
				setState(46);
				pause();
				}
				break;
			case 9:
				_localctx = new Stat_interactadorContext(_localctx);
				enterOuterAlt(_localctx, 9);
				{
				setState(47);
				interactador();
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
	public static class PenCommandContext extends ParserRuleContext {
		public PenCommandContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_penCommand; }
	 
		public PenCommandContext() { }
		public void copyFrom(PenCommandContext ctx) {
			super.copyFrom(ctx);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_upContext extends PenCommandContext {
		public PenCmd_upContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_leftContext extends PenCommandContext {
		public Token penRotateUnits;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenCmd_leftContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_thicknessContext extends PenCommandContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenCmd_thicknessContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_downContext extends PenCommandContext {
		public PenCmd_downContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_rightContext extends PenCommandContext {
		public Token penRotateUnits;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenCmd_rightContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_posContext extends PenCommandContext {
		public PointContext point() {
			return getRuleContext(PointContext.class,0);
		}
		public PenCmd_posContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_pauseContext extends PenCommandContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenCmd_pauseContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_colorContext extends PenCommandContext {
		public TerminalNode Color() { return getToken(ipdrawParser.Color, 0); }
		public PenCmd_colorContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_forwardContext extends PenCommandContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenCmd_forwardContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_backwardContext extends PenCommandContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenCmd_backwardContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_orientationContext extends PenCommandContext {
		public Token penRotateUnits;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenCmd_orientationContext(PenCommandContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class PenCmd_pressureContext extends PenCommandContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PenCmd_pressureContext(PenCommandContext ctx) { copyFrom(ctx); }
	}

	public final PenCommandContext penCommand() throws RecognitionException {
		PenCommandContext _localctx = new PenCommandContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_penCommand);
		int _la;
		try {
			setState(117);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__2:
				_localctx = new PenCmd_posContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(50);
				match(T__2);
				setState(52);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(51);
					match(T__3);
					}
				}

				setState(54);
				point();
				setState(55);
				match(T__4);
				}
				break;
			case T__5:
				_localctx = new PenCmd_colorContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(57);
				match(T__5);
				setState(59);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(58);
					match(T__3);
					}
				}

				setState(61);
				match(Color);
				setState(62);
				match(T__4);
				}
				break;
			case T__6:
				_localctx = new PenCmd_orientationContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(63);
				match(T__6);
				setState(65);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(64);
					match(T__3);
					}
				}

				setState(67);
				expr(0);
				setState(69);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__7 || _la==T__8) {
					{
					setState(68);
					((PenCmd_orientationContext)_localctx).penRotateUnits = _input.LT(1);
					_la = _input.LA(1);
					if ( !(_la==T__7 || _la==T__8) ) {
						((PenCmd_orientationContext)_localctx).penRotateUnits = (Token)_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
				}

				setState(71);
				match(T__4);
				}
				break;
			case T__9:
				_localctx = new PenCmd_thicknessContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(73);
				match(T__9);
				setState(75);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(74);
					match(T__3);
					}
				}

				setState(77);
				expr(0);
				setState(78);
				match(T__4);
				}
				break;
			case T__10:
				_localctx = new PenCmd_pressureContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(80);
				match(T__10);
				setState(82);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__3) {
					{
					setState(81);
					match(T__3);
					}
				}

				setState(84);
				expr(0);
				setState(85);
				match(T__4);
				}
				break;
			case T__11:
				_localctx = new PenCmd_downContext(_localctx);
				enterOuterAlt(_localctx, 6);
				{
				setState(87);
				match(T__11);
				setState(88);
				match(T__4);
				}
				break;
			case T__12:
				_localctx = new PenCmd_upContext(_localctx);
				enterOuterAlt(_localctx, 7);
				{
				setState(89);
				match(T__12);
				setState(90);
				match(T__4);
				}
				break;
			case T__13:
				_localctx = new PenCmd_forwardContext(_localctx);
				enterOuterAlt(_localctx, 8);
				{
				setState(91);
				match(T__13);
				setState(92);
				expr(0);
				setState(93);
				match(T__4);
				}
				break;
			case T__14:
				_localctx = new PenCmd_backwardContext(_localctx);
				enterOuterAlt(_localctx, 9);
				{
				setState(95);
				match(T__14);
				setState(96);
				expr(0);
				setState(97);
				match(T__4);
				}
				break;
			case T__15:
				_localctx = new PenCmd_leftContext(_localctx);
				enterOuterAlt(_localctx, 10);
				{
				setState(99);
				match(T__15);
				setState(100);
				expr(0);
				setState(102);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__7 || _la==T__8) {
					{
					setState(101);
					((PenCmd_leftContext)_localctx).penRotateUnits = _input.LT(1);
					_la = _input.LA(1);
					if ( !(_la==T__7 || _la==T__8) ) {
						((PenCmd_leftContext)_localctx).penRotateUnits = (Token)_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
				}

				setState(104);
				match(T__4);
				}
				break;
			case T__16:
				_localctx = new PenCmd_rightContext(_localctx);
				enterOuterAlt(_localctx, 11);
				{
				setState(106);
				match(T__16);
				setState(107);
				expr(0);
				setState(109);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__7 || _la==T__8) {
					{
					setState(108);
					((PenCmd_rightContext)_localctx).penRotateUnits = _input.LT(1);
					_la = _input.LA(1);
					if ( !(_la==T__7 || _la==T__8) ) {
						((PenCmd_rightContext)_localctx).penRotateUnits = (Token)_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
				}

				setState(111);
				match(T__4);
				}
				break;
			case T__17:
				_localctx = new PenCmd_pauseContext(_localctx);
				enterOuterAlt(_localctx, 12);
				{
				setState(113);
				match(T__17);
				setState(114);
				expr(0);
				setState(115);
				match(T__4);
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
	public static class VarAssignmentContext extends ParserRuleContext {
		public List<TerminalNode> ID() { return getTokens(ipdrawParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(ipdrawParser.ID, i);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public TerminalNode TYPE() { return getToken(ipdrawParser.TYPE, 0); }
		public VarAssignmentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_varAssignment; }
	}

	public final VarAssignmentContext varAssignment() throws RecognitionException {
		VarAssignmentContext _localctx = new VarAssignmentContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_varAssignment);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(120);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==TYPE) {
				{
				setState(119);
				match(TYPE);
				}
			}

			setState(122);
			match(ID);
			{
			setState(123);
			match(T__3);
			setState(124);
			expr(0);
			}
			setState(132);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__18) {
				{
				{
				setState(126);
				match(T__18);
				setState(127);
				match(ID);
				setState(128);
				match(T__3);
				setState(129);
				expr(0);
				}
				}
				setState(134);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(136);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,14,_ctx) ) {
			case 1:
				{
				setState(135);
				match(T__4);
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
		public TerminalNode TYPE() { return getToken(ipdrawParser.TYPE, 0); }
		public List<TerminalNode> ID() { return getTokens(ipdrawParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(ipdrawParser.ID, i);
		}
		public VarDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_varDeclaration; }
	}

	public final VarDeclarationContext varDeclaration() throws RecognitionException {
		VarDeclarationContext _localctx = new VarDeclarationContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_varDeclaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(138);
			match(TYPE);
			setState(139);
			match(ID);
			setState(144);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__18) {
				{
				{
				setState(140);
				match(T__18);
				setState(141);
				match(ID);
				}
				}
				setState(146);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(147);
			match(T__4);
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
	public static class Expr_parenthesisContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Expr_parenthesisContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_varContext extends ExprContext {
		public TerminalNode ID() { return getToken(ipdrawParser.ID, 0); }
		public Expr_varContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_boolContext extends ExprContext {
		public TerminalNode BOOL() { return getToken(ipdrawParser.BOOL, 0); }
		public Expr_boolContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_comparisonContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Expr_comparisonContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_mulContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Expr_mulContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_intContext extends ExprContext {
		public TerminalNode INT() { return getToken(ipdrawParser.INT, 0); }
		public Expr_intContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_pointContext extends ExprContext {
		public PointContext point() {
			return getRuleContext(PointContext.class,0);
		}
		public Expr_pointContext(ExprContext ctx) { copyFrom(ctx); }
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
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_orContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Expr_orContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_REALContext extends ExprContext {
		public TerminalNode REAL() { return getToken(ipdrawParser.REAL, 0); }
		public Expr_REALContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_stringContext extends ExprContext {
		public TerminalNode STRING() { return getToken(ipdrawParser.STRING, 0); }
		public Expr_stringContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_andContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Expr_andContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class Expr_notContext extends ExprContext {
		public Token op;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Expr_notContext(ExprContext ctx) { copyFrom(ctx); }
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 10;
		enterRecursionRule(_localctx, 10, RULE_expr, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(162);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
			case 1:
				{
				_localctx = new Expr_parenthesisContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(150);
				match(T__19);
				setState(151);
				expr(0);
				setState(152);
				match(T__20);
				}
				break;
			case 2:
				{
				_localctx = new Expr_notContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(154);
				((Expr_notContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__21 || _la==T__22) ) {
					((Expr_notContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(155);
				expr(12);
				}
				break;
			case 3:
				{
				_localctx = new Expr_REALContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(156);
				match(REAL);
				}
				break;
			case 4:
				{
				_localctx = new Expr_intContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(157);
				match(INT);
				}
				break;
			case 5:
				{
				_localctx = new Expr_boolContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(158);
				match(BOOL);
				}
				break;
			case 6:
				{
				_localctx = new Expr_varContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(159);
				match(ID);
				}
				break;
			case 7:
				{
				_localctx = new Expr_pointContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(160);
				point();
				}
				break;
			case 8:
				{
				_localctx = new Expr_stringContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(161);
				match(STRING);
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(181);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,18,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(179);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,17,_ctx) ) {
					case 1:
						{
						_localctx = new Expr_andContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(164);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(165);
						((Expr_andContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__23 || _la==T__24) ) {
							((Expr_andContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(166);
						expr(12);
						}
						break;
					case 2:
						{
						_localctx = new Expr_orContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(167);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(168);
						((Expr_orContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & 469762048L) != 0)) ) {
							((Expr_orContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(169);
						expr(11);
						}
						break;
					case 3:
						{
						_localctx = new Expr_comparisonContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(170);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(171);
						((Expr_comparisonContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & 33822867456L) != 0)) ) {
							((Expr_comparisonContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(172);
						expr(10);
						}
						break;
					case 4:
						{
						_localctx = new Expr_mulContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(173);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(174);
						((Expr_mulContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & 2164663517184L) != 0)) ) {
							((Expr_mulContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(175);
						expr(9);
						}
						break;
					case 5:
						{
						_localctx = new Expr_sumContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(176);
						if (!(precpred(_ctx, 7))) throw new FailedPredicateException(this, "precpred(_ctx, 7)");
						setState(177);
						((Expr_sumContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__40 || _la==T__41) ) {
							((Expr_sumContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(178);
						expr(8);
						}
						break;
					}
					} 
				}
				setState(183);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,18,_ctx);
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
	public static class IfContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public StatContext stat() {
			return getRuleContext(StatContext.class,0);
		}
		public IfContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_if; }
	}

	public final IfContext if_() throws RecognitionException {
		IfContext _localctx = new IfContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_if);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(184);
			match(T__42);
			setState(185);
			match(T__19);
			setState(186);
			expr(0);
			setState(187);
			match(T__20);
			setState(188);
			stat();
			setState(190);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,19,_ctx) ) {
			case 1:
				{
				setState(189);
				match(T__4);
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
		public UntilContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_until; }
	}

	public final UntilContext until() throws RecognitionException {
		UntilContext _localctx = new UntilContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_until);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(192);
			match(T__43);
			setState(193);
			match(T__19);
			setState(194);
			expr(0);
			setState(195);
			match(T__20);
			setState(196);
			stat();
			setState(198);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,20,_ctx) ) {
			case 1:
				{
				setState(197);
				match(T__4);
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
	public static class PrintContext extends ParserRuleContext {
		public Token id;
		public Token s;
		public TerminalNode ID() { return getToken(ipdrawParser.ID, 0); }
		public List<TerminalNode> STRING() { return getTokens(ipdrawParser.STRING); }
		public TerminalNode STRING(int i) {
			return getToken(ipdrawParser.STRING, i);
		}
		public PrintContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_print; }
	}

	public final PrintContext print() throws RecognitionException {
		PrintContext _localctx = new PrintContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_print);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(206);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case ID:
				{
				setState(200);
				((PrintContext)_localctx).id = match(ID);
				}
				break;
			case STRING:
				{
				setState(202); 
				_errHandler.sync(this);
				_la = _input.LA(1);
				do {
					{
					{
					setState(201);
					((PrintContext)_localctx).s = match(STRING);
					}
					}
					setState(204); 
					_errHandler.sync(this);
					_la = _input.LA(1);
				} while ( _la==STRING );
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(208);
			match(T__44);
			setState(209);
			match(T__45);
			setState(210);
			match(T__4);
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
		public PauseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_pause; }
	}

	public final PauseContext pause() throws RecognitionException {
		PauseContext _localctx = new PauseContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_pause);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(212);
			match(T__17);
			setState(213);
			expr(0);
			setState(214);
			match(T__4);
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
	public static class InteractadorContext extends ParserRuleContext {
		public InteractadorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_interactador; }
	}

	public final InteractadorContext interactador() throws RecognitionException {
		InteractadorContext _localctx = new InteractadorContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_interactador);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(216);
			match(T__46);
			setState(218);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,23,_ctx) ) {
			case 1:
				{
				setState(217);
				match(T__4);
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
	}

	public final PointContext point() throws RecognitionException {
		PointContext _localctx = new PointContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_point);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(220);
			match(T__19);
			setState(221);
			expr(0);
			setState(222);
			match(T__18);
			setState(223);
			expr(0);
			setState(224);
			match(T__20);
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
		case 5:
			return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 11);
		case 1:
			return precpred(_ctx, 10);
		case 2:
			return precpred(_ctx, 9);
		case 3:
			return precpred(_ctx, 8);
		case 4:
			return precpred(_ctx, 7);
		}
		return true;
	}

	public static final String _serializedATN =
		"\u0004\u00019\u00e3\u0002\u0000\u0007\u0000\u0002\u0001\u0007\u0001\u0002"+
		"\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004\u0007\u0004\u0002"+
		"\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007\u0007\u0007\u0002"+
		"\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b\u0007\u000b\u0001"+
		"\u0000\u0005\u0000\u001a\b\u0000\n\u0000\f\u0000\u001d\t\u0000\u0001\u0000"+
		"\u0001\u0000\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0005\u0001\'\b\u0001\n\u0001\f\u0001*\t\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0003\u00011\b\u0001"+
		"\u0001\u0002\u0001\u0002\u0003\u00025\b\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0002\u0001\u0002\u0001\u0002\u0003\u0002<\b\u0002\u0001\u0002"+
		"\u0001\u0002\u0001\u0002\u0001\u0002\u0003\u0002B\b\u0002\u0001\u0002"+
		"\u0001\u0002\u0003\u0002F\b\u0002\u0001\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0002\u0003\u0002L\b\u0002\u0001\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0002\u0001\u0002\u0003\u0002S\b\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0003\u0002g\b\u0002"+
		"\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0003\u0002"+
		"n\b\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0002\u0003\u0002v\b\u0002\u0001\u0003\u0003\u0003y\b\u0003\u0001"+
		"\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0001"+
		"\u0003\u0001\u0003\u0005\u0003\u0083\b\u0003\n\u0003\f\u0003\u0086\t\u0003"+
		"\u0001\u0003\u0003\u0003\u0089\b\u0003\u0001\u0004\u0001\u0004\u0001\u0004"+
		"\u0001\u0004\u0005\u0004\u008f\b\u0004\n\u0004\f\u0004\u0092\t\u0004\u0001"+
		"\u0004\u0001\u0004\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001"+
		"\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001"+
		"\u0005\u0001\u0005\u0001\u0005\u0003\u0005\u00a3\b\u0005\u0001\u0005\u0001"+
		"\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001"+
		"\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001"+
		"\u0005\u0001\u0005\u0005\u0005\u00b4\b\u0005\n\u0005\f\u0005\u00b7\t\u0005"+
		"\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0006"+
		"\u0003\u0006\u00bf\b\u0006\u0001\u0007\u0001\u0007\u0001\u0007\u0001\u0007"+
		"\u0001\u0007\u0001\u0007\u0003\u0007\u00c7\b\u0007\u0001\b\u0001\b\u0004"+
		"\b\u00cb\b\b\u000b\b\f\b\u00cc\u0003\b\u00cf\b\b\u0001\b\u0001\b\u0001"+
		"\b\u0001\b\u0001\t\u0001\t\u0001\t\u0001\t\u0001\n\u0001\n\u0003\n\u00db"+
		"\b\n\u0001\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0001"+
		"\u000b\u0001\u000b\u0000\u0001\n\f\u0000\u0002\u0004\u0006\b\n\f\u000e"+
		"\u0010\u0012\u0014\u0016\u0000\u0007\u0001\u0000\b\t\u0001\u0000\u0016"+
		"\u0017\u0001\u0000\u0018\u0019\u0001\u0000\u001a\u001c\u0001\u0000\u001d"+
		"\"\u0001\u0000#(\u0001\u0000)*\u0108\u0000\u001b\u0001\u0000\u0000\u0000"+
		"\u00020\u0001\u0000\u0000\u0000\u0004u\u0001\u0000\u0000\u0000\u0006x"+
		"\u0001\u0000\u0000\u0000\b\u008a\u0001\u0000\u0000\u0000\n\u00a2\u0001"+
		"\u0000\u0000\u0000\f\u00b8\u0001\u0000\u0000\u0000\u000e\u00c0\u0001\u0000"+
		"\u0000\u0000\u0010\u00ce\u0001\u0000\u0000\u0000\u0012\u00d4\u0001\u0000"+
		"\u0000\u0000\u0014\u00d8\u0001\u0000\u0000\u0000\u0016\u00dc\u0001\u0000"+
		"\u0000\u0000\u0018\u001a\u0003\u0002\u0001\u0000\u0019\u0018\u0001\u0000"+
		"\u0000\u0000\u001a\u001d\u0001\u0000\u0000\u0000\u001b\u0019\u0001\u0000"+
		"\u0000\u0000\u001b\u001c\u0001\u0000\u0000\u0000\u001c\u001e\u0001\u0000"+
		"\u0000\u0000\u001d\u001b\u0001\u0000\u0000\u0000\u001e\u001f\u0005\u0000"+
		"\u0000\u0001\u001f\u0001\u0001\u0000\u0000\u0000 1\u0003\u0004\u0002\u0000"+
		"!1\u0003\f\u0006\u0000\"1\u0003\u000e\u0007\u0000#1\u0003\u0010\b\u0000"+
		"$(\u0005\u0001\u0000\u0000%\'\u0003\u0002\u0001\u0000&%\u0001\u0000\u0000"+
		"\u0000\'*\u0001\u0000\u0000\u0000(&\u0001\u0000\u0000\u0000()\u0001\u0000"+
		"\u0000\u0000)+\u0001\u0000\u0000\u0000*(\u0001\u0000\u0000\u0000+1\u0005"+
		"\u0002\u0000\u0000,1\u0003\u0006\u0003\u0000-1\u0003\b\u0004\u0000.1\u0003"+
		"\u0012\t\u0000/1\u0003\u0014\n\u00000 \u0001\u0000\u0000\u00000!\u0001"+
		"\u0000\u0000\u00000\"\u0001\u0000\u0000\u00000#\u0001\u0000\u0000\u0000"+
		"0$\u0001\u0000\u0000\u00000,\u0001\u0000\u0000\u00000-\u0001\u0000\u0000"+
		"\u00000.\u0001\u0000\u0000\u00000/\u0001\u0000\u0000\u00001\u0003\u0001"+
		"\u0000\u0000\u000024\u0005\u0003\u0000\u000035\u0005\u0004\u0000\u0000"+
		"43\u0001\u0000\u0000\u000045\u0001\u0000\u0000\u000056\u0001\u0000\u0000"+
		"\u000067\u0003\u0016\u000b\u000078\u0005\u0005\u0000\u00008v\u0001\u0000"+
		"\u0000\u00009;\u0005\u0006\u0000\u0000:<\u0005\u0004\u0000\u0000;:\u0001"+
		"\u0000\u0000\u0000;<\u0001\u0000\u0000\u0000<=\u0001\u0000\u0000\u0000"+
		"=>\u00050\u0000\u0000>v\u0005\u0005\u0000\u0000?A\u0005\u0007\u0000\u0000"+
		"@B\u0005\u0004\u0000\u0000A@\u0001\u0000\u0000\u0000AB\u0001\u0000\u0000"+
		"\u0000BC\u0001\u0000\u0000\u0000CE\u0003\n\u0005\u0000DF\u0007\u0000\u0000"+
		"\u0000ED\u0001\u0000\u0000\u0000EF\u0001\u0000\u0000\u0000FG\u0001\u0000"+
		"\u0000\u0000GH\u0005\u0005\u0000\u0000Hv\u0001\u0000\u0000\u0000IK\u0005"+
		"\n\u0000\u0000JL\u0005\u0004\u0000\u0000KJ\u0001\u0000\u0000\u0000KL\u0001"+
		"\u0000\u0000\u0000LM\u0001\u0000\u0000\u0000MN\u0003\n\u0005\u0000NO\u0005"+
		"\u0005\u0000\u0000Ov\u0001\u0000\u0000\u0000PR\u0005\u000b\u0000\u0000"+
		"QS\u0005\u0004\u0000\u0000RQ\u0001\u0000\u0000\u0000RS\u0001\u0000\u0000"+
		"\u0000ST\u0001\u0000\u0000\u0000TU\u0003\n\u0005\u0000UV\u0005\u0005\u0000"+
		"\u0000Vv\u0001\u0000\u0000\u0000WX\u0005\f\u0000\u0000Xv\u0005\u0005\u0000"+
		"\u0000YZ\u0005\r\u0000\u0000Zv\u0005\u0005\u0000\u0000[\\\u0005\u000e"+
		"\u0000\u0000\\]\u0003\n\u0005\u0000]^\u0005\u0005\u0000\u0000^v\u0001"+
		"\u0000\u0000\u0000_`\u0005\u000f\u0000\u0000`a\u0003\n\u0005\u0000ab\u0005"+
		"\u0005\u0000\u0000bv\u0001\u0000\u0000\u0000cd\u0005\u0010\u0000\u0000"+
		"df\u0003\n\u0005\u0000eg\u0007\u0000\u0000\u0000fe\u0001\u0000\u0000\u0000"+
		"fg\u0001\u0000\u0000\u0000gh\u0001\u0000\u0000\u0000hi\u0005\u0005\u0000"+
		"\u0000iv\u0001\u0000\u0000\u0000jk\u0005\u0011\u0000\u0000km\u0003\n\u0005"+
		"\u0000ln\u0007\u0000\u0000\u0000ml\u0001\u0000\u0000\u0000mn\u0001\u0000"+
		"\u0000\u0000no\u0001\u0000\u0000\u0000op\u0005\u0005\u0000\u0000pv\u0001"+
		"\u0000\u0000\u0000qr\u0005\u0012\u0000\u0000rs\u0003\n\u0005\u0000st\u0005"+
		"\u0005\u0000\u0000tv\u0001\u0000\u0000\u0000u2\u0001\u0000\u0000\u0000"+
		"u9\u0001\u0000\u0000\u0000u?\u0001\u0000\u0000\u0000uI\u0001\u0000\u0000"+
		"\u0000uP\u0001\u0000\u0000\u0000uW\u0001\u0000\u0000\u0000uY\u0001\u0000"+
		"\u0000\u0000u[\u0001\u0000\u0000\u0000u_\u0001\u0000\u0000\u0000uc\u0001"+
		"\u0000\u0000\u0000uj\u0001\u0000\u0000\u0000uq\u0001\u0000\u0000\u0000"+
		"v\u0005\u0001\u0000\u0000\u0000wy\u00051\u0000\u0000xw\u0001\u0000\u0000"+
		"\u0000xy\u0001\u0000\u0000\u0000yz\u0001\u0000\u0000\u0000z{\u00052\u0000"+
		"\u0000{|\u0005\u0004\u0000\u0000|}\u0003\n\u0005\u0000}\u0084\u0001\u0000"+
		"\u0000\u0000~\u007f\u0005\u0013\u0000\u0000\u007f\u0080\u00052\u0000\u0000"+
		"\u0080\u0081\u0005\u0004\u0000\u0000\u0081\u0083\u0003\n\u0005\u0000\u0082"+
		"~\u0001\u0000\u0000\u0000\u0083\u0086\u0001\u0000\u0000\u0000\u0084\u0082"+
		"\u0001\u0000\u0000\u0000\u0084\u0085\u0001\u0000\u0000\u0000\u0085\u0088"+
		"\u0001\u0000\u0000\u0000\u0086\u0084\u0001\u0000\u0000\u0000\u0087\u0089"+
		"\u0005\u0005\u0000\u0000\u0088\u0087\u0001\u0000\u0000\u0000\u0088\u0089"+
		"\u0001\u0000\u0000\u0000\u0089\u0007\u0001\u0000\u0000\u0000\u008a\u008b"+
		"\u00051\u0000\u0000\u008b\u0090\u00052\u0000\u0000\u008c\u008d\u0005\u0013"+
		"\u0000\u0000\u008d\u008f\u00052\u0000\u0000\u008e\u008c\u0001\u0000\u0000"+
		"\u0000\u008f\u0092\u0001\u0000\u0000\u0000\u0090\u008e\u0001\u0000\u0000"+
		"\u0000\u0090\u0091\u0001\u0000\u0000\u0000\u0091\u0093\u0001\u0000\u0000"+
		"\u0000\u0092\u0090\u0001\u0000\u0000\u0000\u0093\u0094\u0005\u0005\u0000"+
		"\u0000\u0094\t\u0001\u0000\u0000\u0000\u0095\u0096\u0006\u0005\uffff\uffff"+
		"\u0000\u0096\u0097\u0005\u0014\u0000\u0000\u0097\u0098\u0003\n\u0005\u0000"+
		"\u0098\u0099\u0005\u0015\u0000\u0000\u0099\u00a3\u0001\u0000\u0000\u0000"+
		"\u009a\u009b\u0007\u0001\u0000\u0000\u009b\u00a3\u0003\n\u0005\f\u009c"+
		"\u00a3\u00054\u0000\u0000\u009d\u00a3\u00053\u0000\u0000\u009e\u00a3\u0005"+
		"5\u0000\u0000\u009f\u00a3\u00052\u0000\u0000\u00a0\u00a3\u0003\u0016\u000b"+
		"\u0000\u00a1\u00a3\u00056\u0000\u0000\u00a2\u0095\u0001\u0000\u0000\u0000"+
		"\u00a2\u009a\u0001\u0000\u0000\u0000\u00a2\u009c\u0001\u0000\u0000\u0000"+
		"\u00a2\u009d\u0001\u0000\u0000\u0000\u00a2\u009e\u0001\u0000\u0000\u0000"+
		"\u00a2\u009f\u0001\u0000\u0000\u0000\u00a2\u00a0\u0001\u0000\u0000\u0000"+
		"\u00a2\u00a1\u0001\u0000\u0000\u0000\u00a3\u00b5\u0001\u0000\u0000\u0000"+
		"\u00a4\u00a5\n\u000b\u0000\u0000\u00a5\u00a6\u0007\u0002\u0000\u0000\u00a6"+
		"\u00b4\u0003\n\u0005\f\u00a7\u00a8\n\n\u0000\u0000\u00a8\u00a9\u0007\u0003"+
		"\u0000\u0000\u00a9\u00b4\u0003\n\u0005\u000b\u00aa\u00ab\n\t\u0000\u0000"+
		"\u00ab\u00ac\u0007\u0004\u0000\u0000\u00ac\u00b4\u0003\n\u0005\n\u00ad"+
		"\u00ae\n\b\u0000\u0000\u00ae\u00af\u0007\u0005\u0000\u0000\u00af\u00b4"+
		"\u0003\n\u0005\t\u00b0\u00b1\n\u0007\u0000\u0000\u00b1\u00b2\u0007\u0006"+
		"\u0000\u0000\u00b2\u00b4\u0003\n\u0005\b\u00b3\u00a4\u0001\u0000\u0000"+
		"\u0000\u00b3\u00a7\u0001\u0000\u0000\u0000\u00b3\u00aa\u0001\u0000\u0000"+
		"\u0000\u00b3\u00ad\u0001\u0000\u0000\u0000\u00b3\u00b0\u0001\u0000\u0000"+
		"\u0000\u00b4\u00b7\u0001\u0000\u0000\u0000\u00b5\u00b3\u0001\u0000\u0000"+
		"\u0000\u00b5\u00b6\u0001\u0000\u0000\u0000\u00b6\u000b\u0001\u0000\u0000"+
		"\u0000\u00b7\u00b5\u0001\u0000\u0000\u0000\u00b8\u00b9\u0005+\u0000\u0000"+
		"\u00b9\u00ba\u0005\u0014\u0000\u0000\u00ba\u00bb\u0003\n\u0005\u0000\u00bb"+
		"\u00bc\u0005\u0015\u0000\u0000\u00bc\u00be\u0003\u0002\u0001\u0000\u00bd"+
		"\u00bf\u0005\u0005\u0000\u0000\u00be\u00bd\u0001\u0000\u0000\u0000\u00be"+
		"\u00bf\u0001\u0000\u0000\u0000\u00bf\r\u0001\u0000\u0000\u0000\u00c0\u00c1"+
		"\u0005,\u0000\u0000\u00c1\u00c2\u0005\u0014\u0000\u0000\u00c2\u00c3\u0003"+
		"\n\u0005\u0000\u00c3\u00c4\u0005\u0015\u0000\u0000\u00c4\u00c6\u0003\u0002"+
		"\u0001\u0000\u00c5\u00c7\u0005\u0005\u0000\u0000\u00c6\u00c5\u0001\u0000"+
		"\u0000\u0000\u00c6\u00c7\u0001\u0000\u0000\u0000\u00c7\u000f\u0001\u0000"+
		"\u0000\u0000\u00c8\u00cf\u00052\u0000\u0000\u00c9\u00cb\u00056\u0000\u0000"+
		"\u00ca\u00c9\u0001\u0000\u0000\u0000\u00cb\u00cc\u0001\u0000\u0000\u0000"+
		"\u00cc\u00ca\u0001\u0000\u0000\u0000\u00cc\u00cd\u0001\u0000\u0000\u0000"+
		"\u00cd\u00cf\u0001\u0000\u0000\u0000\u00ce\u00c8\u0001\u0000\u0000\u0000"+
		"\u00ce\u00ca\u0001\u0000\u0000\u0000\u00cf\u00d0\u0001\u0000\u0000\u0000"+
		"\u00d0\u00d1\u0005-\u0000\u0000\u00d1\u00d2\u0005.\u0000\u0000\u00d2\u00d3"+
		"\u0005\u0005\u0000\u0000\u00d3\u0011\u0001\u0000\u0000\u0000\u00d4\u00d5"+
		"\u0005\u0012\u0000\u0000\u00d5\u00d6\u0003\n\u0005\u0000\u00d6\u00d7\u0005"+
		"\u0005\u0000\u0000\u00d7\u0013\u0001\u0000\u0000\u0000\u00d8\u00da\u0005"+
		"/\u0000\u0000\u00d9\u00db\u0005\u0005\u0000\u0000\u00da\u00d9\u0001\u0000"+
		"\u0000\u0000\u00da\u00db\u0001\u0000\u0000\u0000\u00db\u0015\u0001\u0000"+
		"\u0000\u0000\u00dc\u00dd\u0005\u0014\u0000\u0000\u00dd\u00de\u0003\n\u0005"+
		"\u0000\u00de\u00df\u0005\u0013\u0000\u0000\u00df\u00e0\u0003\n\u0005\u0000"+
		"\u00e0\u00e1\u0005\u0015\u0000\u0000\u00e1\u0017\u0001\u0000\u0000\u0000"+
		"\u0018\u001b(04;AEKRfmux\u0084\u0088\u0090\u00a2\u00b3\u00b5\u00be\u00c6"+
		"\u00cc\u00ce\u00da";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}