// Generated from /home/robertocastro/Desktop/EstudoC/Teste Recurso/Resolucao/ComplexNumbers.g4 by ANTLR 4.9.2
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class ComplexNumbersLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		COMPLEX=10, ID=11, REAL=12, NUMBER=13, WS=14, COMMENT=15, ERROR=16;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"COMPLEX", "ID", "REAL", "NUMBER", "WS", "COMMENT", "ERROR"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'display'", "'<='", "'('", "')'", "'+'", "'-'", "'*'", 
			"':'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, "COMPLEX", 
			"ID", "REAL", "NUMBER", "WS", "COMMENT", "ERROR"
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


	public ComplexNumbersLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "ComplexNumbers.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\22o\b\1\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\3\2\3\2\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b"+
		"\3\b\3\t\3\t\3\n\3\n\3\13\5\13>\n\13\3\13\5\13A\n\13\3\13\5\13D\n\13\3"+
		"\13\3\13\3\f\3\f\6\fJ\n\f\r\f\16\fK\5\fN\n\f\3\r\3\r\3\r\5\rS\n\r\3\16"+
		"\6\16V\n\16\r\16\16\16W\3\17\3\17\3\17\3\17\3\20\3\20\3\20\3\20\3\20\3"+
		"\20\3\20\7\20e\n\20\f\20\16\20h\13\20\3\20\3\20\3\20\3\20\3\21\3\21\3"+
		"f\2\22\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17"+
		"\35\20\37\21!\22\3\2\6\4\2--//\5\2\62;C\\c|\3\2\62;\5\2\13\f\17\17\"\""+
		"\2v\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3"+
		"\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2"+
		"\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\3#\3"+
		"\2\2\2\5%\3\2\2\2\7-\3\2\2\2\t\60\3\2\2\2\13\62\3\2\2\2\r\64\3\2\2\2\17"+
		"\66\3\2\2\2\218\3\2\2\2\23:\3\2\2\2\25=\3\2\2\2\27G\3\2\2\2\31O\3\2\2"+
		"\2\33U\3\2\2\2\35Y\3\2\2\2\37]\3\2\2\2!m\3\2\2\2#$\7=\2\2$\4\3\2\2\2%"+
		"&\7f\2\2&\'\7k\2\2\'(\7u\2\2()\7r\2\2)*\7n\2\2*+\7c\2\2+,\7{\2\2,\6\3"+
		"\2\2\2-.\7>\2\2./\7?\2\2/\b\3\2\2\2\60\61\7*\2\2\61\n\3\2\2\2\62\63\7"+
		"+\2\2\63\f\3\2\2\2\64\65\7-\2\2\65\16\3\2\2\2\66\67\7/\2\2\67\20\3\2\2"+
		"\289\7,\2\29\22\3\2\2\2:;\7<\2\2;\24\3\2\2\2<>\5\31\r\2=<\3\2\2\2=>\3"+
		"\2\2\2>@\3\2\2\2?A\t\2\2\2@?\3\2\2\2@A\3\2\2\2AC\3\2\2\2BD\5\31\r\2CB"+
		"\3\2\2\2CD\3\2\2\2DE\3\2\2\2EF\7k\2\2F\26\3\2\2\2GM\t\3\2\2HJ\t\4\2\2"+
		"IH\3\2\2\2JK\3\2\2\2KI\3\2\2\2KL\3\2\2\2LN\3\2\2\2MI\3\2\2\2MN\3\2\2\2"+
		"N\30\3\2\2\2OR\5\33\16\2PQ\7\60\2\2QS\5\33\16\2RP\3\2\2\2RS\3\2\2\2S\32"+
		"\3\2\2\2TV\t\4\2\2UT\3\2\2\2VW\3\2\2\2WU\3\2\2\2WX\3\2\2\2X\34\3\2\2\2"+
		"YZ\t\5\2\2Z[\3\2\2\2[\\\b\17\2\2\\\36\3\2\2\2]^\7,\2\2^_\7E\2\2_`\7Q\2"+
		"\2`a\7O\2\2ab\7,\2\2bf\3\2\2\2ce\13\2\2\2dc\3\2\2\2eh\3\2\2\2fg\3\2\2"+
		"\2fd\3\2\2\2gi\3\2\2\2hf\3\2\2\2ij\7\f\2\2jk\3\2\2\2kl\b\20\2\2l \3\2"+
		"\2\2mn\13\2\2\2n\"\3\2\2\2\13\2=@CKMRWf\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}